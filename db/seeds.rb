
jkrowling = Author.create(name: "J K Rolwing")
jrtolkien = Author.create(name: "R Tolkien")
jbond = Author.create(name: "James Bond")
multiple = Author.create(name: "Several")
herman_melville = Author.create(name: "Herman Melville")
james_barrie = Author.create(name: "James Barrie")
albert_einstien = Author.create(name: "Albert Einstein")

harry_potter = Book.create(name: "Harry Potter", author_id: 1)
harry_potter.author = jkrowling
bible = Book.create(name: "Bible", author_id: 2)
bible.author = multiple
moby_dick = Book.create(name: "Moby Dick")
lotr = Book.create(name: "Lord of The Rings")
peter_pan = Book.create(name: "Peter Pan")
relativity = Book.create(name: "Theory of Relativity")


fiction = Subject.create(name: "Fiction")
fantasy = Subject.create(name: "Fantasy")
non_fiction = Subject.create(name: "Non Fiction")
romance = Subject.create(name: "Romance")
self_help = Subject.create(name: "Self Help")
