# Algorithm Selection for Combinatorial Search Problems: A Survey

This repository contains the sources for the summary table of the algorithm
selection survey, available online at http://larskotthoff.github.io/assurvey/

## Compiling

The main source is `summary.tex`. Compile it with LaTeX, then run bibtex, which
will pick up the references in `survey.bib`. This will generate the document
with the table.

To generate the web version, go to the `web/` subdirectory and run `run.sh`.
This will update `lit.json`. `index.html` should be updated manually with the
last modified date as appropriate.

## Modifying

To add new references, add the bib entry to `survey.bib` and a new entry in the
table in `summary.tex` using the format that the other entries use. Please try
to keep the descriptions in the columns short and use terms that already exist
if possible so that the entries group together nicely.

## Citing

If you find this reference useful, please cite

Kotthoff, Lars. "Algorithm Selection for Combinatorial Search Problems: A Survey." AI Magazine, 2014.

    @article{kotthoff_algorithm_2014,
	  title = {Algorithm Selection for Combinatorial Search Problems: A survey},
	  author = {Kotthoff, Lars},
      journal = {{AI} Magazine},
      volume = {35},
      number = {3},
      pages = {48--60},
	  year = {2014}
    }

## Contributors

I'd like to thank Marius Lindauer, Kobi Gal, Tiago Cunha, Akrem Benatia, and
Mengqi Hu, who provided references for this summary.

## Additional References

The following list of references is relevant, but not included because the
papers are behind a paywall I do not have access to them:
- Tor Gunnar Houeland, Agnar Aamodt; "A learning system based on lazy metareasoning"; Progress in Artificial Intelligence, June 2018, Volume 7, Issue 2, pp 129-146
- Wojciech Bożejko, Andrzej Gnatowski, Teodor Niżyński, Michael Affenzeller, Andreas Beham; "Local Optima Networks in Solving Algorithm Selection Problem for TSP"; International Conference on Dependability and Complex Systems 2018
