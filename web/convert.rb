#!/usr/bin/env ruby
# encoding: UTF-8

require 'rubygems'
require 'json'

TEX = ARGV[0]
BBL = ARGV[1]

# key: citation key
# value: [short citation (stuff in \bibitem), full citation]
bibs = {}

agg = ""
doneski = true
IO.readlines(BBL).each { |b|
    bp = b.strip
    if bp =~ /^\\bibitem/ or not doneski
        doneski = false
        if bp.empty?
            m = agg.strip.scan(/^\\bibitem\[.*\\citeauthoryear\{.*\}(\{.+?\})(\{[0-9a-z]+\})\]\{(.+?)\}\s*(.+)$/m)
            if m.empty?
                puts agg
            else
                bibs[m[0][2]] = [m[0][0] + " " + m[0][1], m[0][3]]
            end
            agg = ""
            doneski = true
        else
            if bp =~ /%$/
                agg += bp.chomp('%')
            else
                agg += bp + " "
            end
        end
    end
}

lines = []
headers = ["citation", "domain", "features", "predict what", "predict how",
           "predict when", "portfolio"]
lit = []

agg = ""
doneski = true
IO.readlines(TEX).each { |t|
    if t =~ /^\\citeA/ or not doneski
        doneski = false
        agg += (agg.empty? ? "" : " ") + t.strip
        if agg[-2..-1] == "\\\\"
            lines << agg[0..-3]
            agg = ""
            doneski = true
        end
    end
}

transformations = [[/\\"i/, 'ï'],
                  [/\\\^i/, 'î'],
                  [/\\'o/, 'ó'],
                  [/\\'i/, 'í'],
                  [/\\'c/, 'ć'],
                  [/\\v\{c\}/, 'č'],
                  [/\\c\{c\}/, 'ç'],
                  [/\\"u/, 'ü'],
                  [/\\"o/, 'ö'],
                  [/\\ss/, 'ß'],
                  [/\\_/, '_'],
                  [/\\ /, ' '],
                  [/\\\//, ''],
                  [/\$(.+?)\$/, '<i>\1</i>'],
                  [/\\citeA\{(.+?)\}/, '\1'],
                  [/\\emph\{(.+?)\}([.,])/, '<i>\1</i>\2'],
                  [/\{\\em (.+?)\}([.,~])/, '<i>\1</i>\2'],
                  [/~/, '&nbsp;'],
                  [/\\newblock /, '<br/>'],
                  [/\\sc /, ''],
                  [/--/, '&mdash;'],
                  [/\\&/, '&amp;'],
                  [/\{\\natexlab\{.+?\}\}/, ''],
                  [/\\penalty0 /, ''],
                  [/\\mbox\{(.+?)\}/, '\1'],
                  # catchall, twice for nested stuff
                  [/\{(.+?)\}/, '\1'],
                  [/\{(.+?)\}/, '\1']]

lines.each { |l| transformations.each{ |t| l.gsub!(t[0], t[1]) } }
bibs.values.each { |l| transformations.each{ |t|
    l[0].gsub!(t[0], t[1])
    l[1].gsub!(t[0], t[1])
} }

lines.each { |l|
    parts = l.split(/\s*&\s*/)
    year = parts[0].split(',')[0].split(/_/)[-1].to_i
    h = {"year" => year}
    h["citation"] =
        {"short" => parts[0].split(/,/).collect { |s| bibs[s][0] }.join(", "),
        "long" => parts[0].split(/,/).collect { |s| bibs[s][1] }.join("<br/><br/>")}
    (1..parts.length-1).each { |i|
        h[headers[i]] = parts[i]
    }
    lit << h
}

puts lit.to_json

#puts (["year"] + headers).join(",")
#lit.each { |l|
#    years = l["citation"]["short"].scan(/[0-9]{4}/)
#    years.each { |y|
#        puts ([y] + [""] + headers[1..-1].collect { |h| l[h].gsub(/,/, "") }).join(",")
#    }
#}
