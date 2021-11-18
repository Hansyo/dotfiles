# http://www2.yukawa.kyoto-u.ac.jp/~koudai.sugimoto/dokuwiki/doku.php?id=latex:latexmk%E3%81%AE%E8%A8%AD%E5%AE%9A
$latex = 'platex -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %O %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';
$max_repeat = 10;

$pdf_mode = 3;

# preview
$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
	$dvi_previewer = "xdg-open %S";
	$pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
	$dvi_previewer = "open %S";
	$pdf_previewer = "open %S";
} else {
	$dvi_previewer = "start %S";
	$pdf_previewer = "start %S";
}
