# Groff_hdtbl with repeating header row
To create a table that span multiple pages with repeating header row and alternating row colors is not an easy job in gnu groff.
*Groff tbl* macro has a robust capability to create table that span multiple pages with repeating header row. But its lack of row background color make it difficult for most people to use it for generating business style report.  
*Groff_hdtbl* on the other hand, can generate tables with the same ease of formatting as an html table; but that is only for tables that fit on a single page. When the table spans more than one page, groff_hdtl draws nothing on the paper.
# How can we generate tables that span multiple pages with repeating header row and alternating row colors then?
Well, there is twist to it. Of course we are going to use groff_hdtbl macro and a custom macro will that detect the page header and add the header rows autiomatically when needed.

# Page header Trap
We need to create a macro that will be executed using the diversion .wh (when) macro. The .wh macro is used to execute certain macro at specified location on the page. In our case, we'll use it create table header at the start of a new page. Don't worry, it is not complicated at all. The code looks like this:
```
.de THEADER
.TBL fgc=red4 width='10% 25% 10% 20% 20% 15%' border=0.2n
.TR .TH Count .TH Full Name .TH Wage .TH Office .TH Title .TH Start Date
.ETB
..
.wh 1c THEADER
```
We created a custom macro named *THEADER* the set up the table heading row and executed our macro the .wh macro with the arguiment _1c_ which literally means, run this macro whe the page header is 1cm.  
