<?php

require '/usr/share/php/Parsedown/Parsedown.php';

if ($argc < 2) {
    echo "Usage: md2html.php <markdown_file>\n";
    exit(1);
}

$markdownFile = $argv[1];
$markdown = '';

if (!file_exists($markdownFile)) {
    // Send error as HTML output
    $markdown = "File not found: $markdownFile\n";
} else {
    // Read Markdown file
    $markdownContent = file_get_contents($markdownFile);

    // Convert Markdown to HTML using external library Parsedown
    $parsedown = new Parsedown();
    $markdown = $parsedown->text($markdownContent);
}

// Wrap in basic HTML structure
$htmlContent = <<<HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Markdown Preview</title>
  <link rel="stylesheet" type="text/css" href="file:///etc/mdview/style.css">
  <link rel="stylesheet" type="text/css" href="file:///usr/share/javascript/highlight.js/styles/default.css">
  <script type="text/javascript" src="file:///usr/share/javascript/highlight.js/highlight.js"></script>
  <script type="text/javascript" src="file:///usr/share/javascript/mathjax/MathJax.js?config=TeX-MML-AM_CHTML"></script>
</head>
<body>
$markdown
<script>
  document.querySelectorAll('pre code').forEach((block) => {
    hljs.highlightBlock(block);
  });
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [['$', '$'], ['\\(', '\\)']],
      displayMath: [['$$', '$$'], ['\\[', '\\]']],
      ignoreClass: "no-mathjax"
    }
  });
</script>
</body>
</html>
HTML;

// Save to temporary file
$tempFile = tempnam(sys_get_temp_dir(), 'md_');
file_put_contents($tempFile, $htmlContent);

// Open in default browser
system("open \"$tempFile\"");
