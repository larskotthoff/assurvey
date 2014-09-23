# Algorithm Selection for Combinatorial Search Problems: A survey

This repository contains the sources for the summary table of the algorithm
selection survey, available online at http://larskotthoff.github.io/assurvey/

## Compiling

The main source is `summary.tex`. Compile it with LaTeX, then run bibtex, which
will pick up the references in `survey.bib`. This will generate the document
with the table.

To generate the web version, go to the `web/` subdirectory and run `run.sh`.
This will update `lit.json`, which you need to copy and paste into `index.html`
at the appropriate position (replace the existing pasted JSON).

## Modifying

To add new references, add the bib entry to `survey.bib` and a new entry in the
table in `summary.tex` using the format that the other entries use. Please try
to keep the descriptions in the columns short and use terms that already exist
so that the entries group together nicely.

## Citing

If you find this reference useful, please cite

Kotthoff, Lars. "Algorithm Selection for Combinatorial Search Problems: A Survey." AI Magazine, 2014 (in press).

    @article{kotthoff_algorithm_2014,
	  title = {Algorithm Selection for Combinatorial Search Problems: A survey},
	  author = {Kotthoff, Lars},
      journal = {AI Magazine},
	  year = {2014},
      note = {in press}
    }

## Contributors

I'd like to thank Marius Lindauer, who provided some of the references in this
summary.
