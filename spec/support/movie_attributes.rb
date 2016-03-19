def movie_attributes(attrs={})
	{
		title: "Iron Man",
		rating: "PG-13",
		total_gross: 318412101.00,
		description: "Tony Stark builds an armored suit to fight the throes of evil",
		released_on: "2008-05-02",
		cast: "Robert Downey Jr., Gwyneth Paltrow",
		director: "Jon Favreau",
		duration: "126 min",
		image_file_name: "catwoman.jpg"
	}.merge(attrs)

end