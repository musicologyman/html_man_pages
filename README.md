# HTML display of man pages

## Intro

You know what's a huge pain in the ass? Reading `man` pages in a cli window. 

You know what else is a huge pain in the ass? Reading `man` pages that don't
contain any links for quick navigation. 

You know what's a little better but still a pain in the ass, just not a huge
one? Going out the interwebs to find an html version of the man page.

Okay, when I've searched for and found an HTML version on the web, I could
bookmark it or something like that. Problem is, that's just not how I work.

To address this problem, I've begun to put together a set of man pages in html
format for command-line utilities to which I frequently refer. In order to view
them, I run a local python http server on a port I'm not going to forget--I use
54322. Then, any time I want to refer to a man page for which I have an HTML
version, all I have to do is go to http://localhost:54321/ in my browser. The
index.html page that appears there provides me links to the html version of the
man page for which I'm searching.

## Converting man pages

I use one of two methods for converting man pages. For some, the man2html
utility can be helpful, but the html it provides isn't very pretty, and it
doesn't give me the raw material for links to various sections of the page.

Enter [Asciidoctor](https://asciidoctor.org).

(Asciidoctor is a sort of markdown on steroids. Its syntax is similar but not
identical to various flavors of markdown. Asciidoctor provides, however, some
capabilities are either unavailable or are a bit more involved to pull off in
markdown. (I'll leave it to you to discover what some of those are.) One of
these features, for example, is the automatic generation of a table of contents,
complete with links to sections and subsections, which can be displayed either
at the top of the document or, as I find most convenient, on the left or right
side of the window containing the main content.)

As an alternative to man2html, I use pandoc to convert the man page. I will
typically begin by running a command like this:

```bash
pandoc -i $(man -w awk) -o awk.adoc -f man -t asciidoc
```

At this point, I can edit the asciidoc file. (I usually use VS Code, because it
provides a good side-by-side preview of the html to be generated, but there are
a number of other tools that do similar things.) I typically tweak the document,
almost always adding a document title, a table of contents attribute, and an
indication not add a footer to indicate when the document is generated.

```asciidoc
= awk
:toc: left
:nofooter:
``` 

When I've finished, I'll run the script in the asciidoc folder `run_asciidoc.sh`
in order first to generate an html file and then to prettify it using HTML Tidy.
(If you want to adjust the HTML, it's a lot easier if the document is nicely
formatted before you start working on it.)
