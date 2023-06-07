Annotated bibliography
======================

This repository provides an example on how to set up :code:`BibLaTeX`, aimed to
help produce annotated bibliographies with the lowest friction possible for us,
beyond writing the annotations themselves.

We can do this without including any packages other than :code:`biblatex`,
which will do all the heavy lifting. We will see we do not need to touch our
compilation procedure.

For an great guide on what an annotated bibliography is how to write one see
`<https://i.ntnu.no/academic-writing/annotated-bibliography>`_.

Usage example
-------------

Say we want to include a reference to the TeXbook by Knuth in our annotated
bibliography. We first add a reference to it in our :code:`./references.bib`
file in the usual way, for example:

.. code::

    @book{knuth84,
        author = {Knuth, Donald E.},
        title = {The \TeX{}book: a complete user's guide to computer
                 typesetting with \TeX},
        publisher = {Addison--Wesley},
        year = {1984},
        isbn = {0-201-13447-0},
    }

We must now remember the entry key we have given to this reference, here
:code:`knuth84`.

Under the directory :code:`./annotations/` we create a new file named
:code:`<entry-key>.tex`. In this case, this would be
:code:`./annotations/knuth84.tex`.

We can now write our annotation directly into the file, without needing to
include any boilerplate code (in particular, no :code:`\begin{document}` and
:code:`\end{document}`), in normal LaTeX code. We can use any macros we can use
in our main document, and even cite other entries in our bibliography!

Once the document is compiled, our the reference will be added to our beautiful
annotated bibliography, provided it was cited somewhere. For this toy example,
the macro :code:`\nocite{*}` makes sure any references found in our
bibliography files are automatically included, but this is not recommended for
an actual project.

As you can see, we only need to create an empty file with the name we just
chose. The remaining energy can be used in writing our annotation.

Adding abstracts
----------------

No need to include the abstract to our references in our bibliography file. We
can also hide the away into individual files for any reference. We must simply
include the abstract text directly into a file named :code:`<entry-key>.tex`,
this time under the directory :code:`./abstracts/`.

Again, you can harness all power of LaTeX in this file, while not needing to
include any boilerplate. The abstract will appear under your annotation.

Compiling
---------

No special instructions are needed when compiling a document with such a
bibliography. We just need to use the commands we were already using to
generate any document with a bibliography.

To compile this example, we can simply run the following commands in order:

.. code::

    $ pdflatex main
    $ biber main
    $ pdflatex main

We are now ready enjoy the result in our favourite PDF viewer.

Helper script
-------------

To help to remember what annotations or abstracts one is missing, the
:code:`./check.sh` script is included. We must simply run the script, and it
will compare the references we have provided in your :code:`./references.bib`
file with the existing files under :code:`./annotations/` and
:code:`./abstracts/`, and warn us if we are missing any annotations or
abstracts! If we run the :code:`./check.sh` script in this example we will
notice we are missing an abstract file.

To use take full advantage of this script, it is convenient we do not simply
create empty placeholder files for annotations and abstracts of the entries in
our references file.

Using it in our projects
------------------------

To use this in our project we must simply set the flag :code:`entrykey=true` in
our :code:`biblatex` package options, and insert the following commands into
our preamble:

.. code::

    \def\bibabstractprefix{./abstracts/}
    \def\bibannotationprefix{./annotations/}

Although not necessary, we can also insert the following commands for style:

.. code::

    \DeclareFieldFormat{annotation}{\textbf{Annotations:}~#1}
    \DeclareFieldFormat{abstract}{\textbf{Abstract:}~#1}

Before publishing
-----------------

For convenience during edition, the option to the :code:`BibLaTeX` package
:code:`entrykey=true` is included, but it is recommended that we set this flag
to :code:`entrykey=false` before generating a release version of the document.
