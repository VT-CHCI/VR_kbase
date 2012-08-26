$.ajax({
		type: "GET",
		url: "sites.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('site').each(function(){
				var id = $(this).attr('id');
				var title = $(this).find('title').text();
				var url = $(this).find('url').text();
				$('<div class="items" id="link_'+id+'"></div>').html('<a href="'+url+'">'+title+'</a>').appendTo('#page-wrap');
				$(this).find('desc').each(function(){
					var brief = $(this).find('brief').text();
					var long = $(this).find('long').text();
					$('<div class="brief"></div>').html(brief).appendTo('#link_'+id);
					$('<div class="long"></div>').html(long).appendTo('#link_'+id);
				});
			});
		}
	});

    <div class="field">
      <%= f.label :num_views %><br />
      <%= f.number_field :num_views %>
    </div>


<div id="circular3dG">
	<div id="circular3d_1G" class="circular3dG"></div>
	<div id="circular3d_2G" class="circular3dG"></div>
	<div id="circular3d_3G" class="circular3dG"></div>
	<div id="circular3d_4G" class="circular3dG"></div>
	<div id="circular3d_5G" class="circular3dG"></div>
	<div id="circular3d_6G" class="circular3dG"></div>
	<div id="circular3d_7G" class="circular3dG"></div>
	<div id="circular3d_8G" class="circular3dG"></div>
</div>

({"doi_records":
	{"doi_record":
		{"@attributes":
			{"owner":"10.1016", "timestamp":"2011-09-26 03:45:40"
			},
		"crossref":
			{"journal":
				{"journal_metadata":
					{"@attributes":
						{"language":"en"
						},
						"full_title":"International Journal of Human-Computer Studies","abbrev_title":"International Journal of Human-Computer Studies","issn":"10715819"
					},
				"journal_issue":
					{"publication_date":
						{"@attributes":
							{"media_type":"print"
							},"month":"3","year":"2009"
						},
						"journal_volume":
							{"volume":"67"
							},"issue":"3"
					},
				"journal_article":
					{"@attributes":
						{"publication_type":"full_text"
						},
					"titles":
						{"title":"Current trends in 3D user interface research"
						},
					"contributors":
						{"person_name":[
							{"@attributes":
								{"contributor_role":"author","sequence":"first"
								},
							"given_name":"Doug","surname":"Bowman"
							},
							{"@attributes":
								{"contributor_role":"author","sequence":"additional"
								},
							"given_name":"Bernd","surname":"Fr\u00f6hlich"
							},
							{"@attributes":
								{"contributor_role":"author","sequence":"additional"
								},
							"given_name":"Yoshifumi","surname":"Kitamura"
							},
							{"@attributes":
								{"contributor_role":"author","sequence":"additional"
								},
							"given_name":"Wolfgang","surname":"Stuerzlinger"
							}]
						},
					"publication_date":
						{"@attributes":
							{"media_type":"print"
							},
						"month":"3","year":"2009"
						},"pages":
							{"first_page":"223","last_page":"224"
							},
						"publisher_item":
							{"item_number":"S1071581908001444","identifier":"S1071581908001444"
							},
							"doi_data":
							{"doi":"10.1016\/j.ijhcs.2008.10.003","resource":"http:\/\/linkinghub.elsevier.com\/retrieve\/pii\/S1071581908001444"
							}
					}
				}
			}
		}
	}
})
