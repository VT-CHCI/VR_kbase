// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function remove_fields(link) {
  console.log($(link));
  $(link).prev("input[type=hidden]").val("true");
  $(link).parent().hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  console.log(new_id);
  console.log(regexp);

  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function(){
  $('#submit_doi').click(function() {
    if ($('#paper_doi').val()) {
      $('.loading_content').animate({opacity: '1'},500)
      // var surl = "http://www.crossref.org/openurl/?id=doi:" + $('#paper_doi').val() + "&noredirect=true&pid=scerbo@vt.edu&format=unixref";
      var surl = "http://people.cs.vt.edu/tgm/crossref-doi.php?doi=" + $('#paper_doi').val();
  
      $.ajax({
        type: "GET",
        url: surl,
        dataType: "jsonp",
        success: function(data) {
          // data = ({"doi_records":{"doi_record":{"@attributes":{"owner":"10.1016","timestamp":"2011-09-26 03:45:40"},"crossref":{"journal":{"journal_metadata":{"@attributes":{"language":"en"},"full_title":"International Journal of Human-Computer Studies","abbrev_title":"International Journal of Human-Computer Studies","issn":"10715819"},"journal_issue":{"publication_date":{"@attributes":{"media_type":"print"},"month":"3","year":"2009"},"journal_volume":{"volume":"67"},"issue":"3"},"journal_article":{"@attributes":{"publication_type":"full_text"},"titles":{"title":"Current trends in 3D user interface research"},"contributors":{"person_name":[{"@attributes":{"contributor_role":"author","sequence":"first"},"given_name":"Doug","surname":"Bowman"},{"@attributes":{"contributor_role":"author","sequence":"additional"},"given_name":"Bernd","surname":"Fr\u00f6hlich"},{"@attributes":{"contributor_role":"author","sequence":"additional"},"given_name":"Yoshifumi","surname":"Kitamura"},{"@attributes":{"contributor_role":"author","sequence":"additional"},"given_name":"Wolfgang","surname":"Stuerzlinger"}]},"publication_date":{"@attributes":{"media_type":"print"},"month":"3","year":"2009"},"pages":{"first_page":"223","last_page":"224"},"publisher_item":{"item_number":"S1071581908001444","identifier":"S1071581908001444"},"doi_data":{"doi":"10.1016\/j.ijhcs.2008.10.003","resource":"http:\/\/linkinghub.elsevier.com\/retrieve\/pii\/S1071581908001444"}}}}}}})

          console.log(data);
          try {
            var entry = $.parseJSON(data);
            console.log(entry);
            //must be valid JSON
          } catch(e) {
            console.log(e);
            //must not be valid JSON    
          }
          // console.log(entry);
          $('.loading_content').animate({opacity: '0'},500)
        },
        error: function(tmp) {
          console.log(tmp);
          console.log("error");
        }
      });
    }
  });
});