# CSS: media queries

## How do you optimize your webpages for print

```
/* Common styles */
@media screen { /* Screen media styles */ }
@media print { 
	/* Paper media styles */
	a[href]:after { 
		/* Display URLs for links */
		content: " (" attr(href) ")"; 
	}	
	#page-footer { content: "This information can be accessed online at blog.tbhcreative.com"; }
}
```

- Clean: remove decorative and interactive elements
- Sizes: reduce page margins, spacing between elements. Standard cm, mm units may be more practical
- Contast: use black text on a white background, change text size