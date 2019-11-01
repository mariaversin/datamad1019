
# CHALLENGE 1

SELECT titles.title, authors.au_id, (titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100) AS sales_royalty
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
LEFT JOIN roysched ON sales.title_id = roysched.title_id
LEFT JOIN titles ON titles.title_id = roysched.title_id
GROUP BY au_id
ORDER BY sales_royalty 
DESC;


SELECT AUTHORS , TITLE, SUM(sales_royalty) AS TOTAL
FROM
(SELECT titles.title as TITLE, authors.au_id as AUTHORS, (titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100) AS sales_royalty
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
LEFT JOIN roysched ON sales.title_id = roysched.title_id
LEFT JOIN titles ON titles.title_id = roysched.title_id
ORDER BY sales_royalty 
DESC) as royalties
GROUP BY AUTHORS, TITLE;


SELECT AUTHORS , TITLE, SUM(sales_royalty) AS TOTAL, ADVANCE
FROM
(SELECT titles.advance as ADVANCE,titles.title as TITLE, authors.au_id as AUTHORS, (titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100) AS sales_royalty
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
LEFT JOIN roysched ON sales.title_id = roysched.title_id
LEFT JOIN titles ON titles.title_id = roysched.title_id
ORDER BY sales_royalty 
DESC) as royalties
GROUP BY AUTHORS, TITLE;

# CHALLENGE 2

