window.onload = function() {

    //Check File API support
    if (window.File && window.FileList && window.FileReader) {
        var filesInput = document.getElementById("files");

        filesInput.addEventListener("change", function(event) {

            var files = event.target.files; //FileList object
            /* var output = document.getElementById("result"); */

            for (var i = 0; i < files.length; i++) {
                var file = files[i];

                //Only json files
                if (!file.name.match(/.json/)) continue; 

                var jsonFileReader = new FileReader();

                jsonFileReader.addEventListener("load", function(event) {

                    var fileToPost = event.target.result;
                    
                                        
                    $.ajax({
                      url: '/insert_site_db',
                      type: 'POST',
                      data: fileToPost,
                      dataType: 'json',
                      contentType: 'application/json; charset=UTF-8',
                      beforeSend: function(){
                      // Handle the beforeSend event
                      
                      },
                      /*progress: function(evt) {
                        if (evt.lengthComputable) {
                        console.log("Loaded " + parseInt( (evt.loaded / evt.total * 100), 10) + "%");
                        }
                        else {
                          console.log("Length not computable.");
                        }
                      },*/
                      xhr: function()
                      {
                      var xhr = new window.XMLHttpRequest();
                      //Upload progress
                      xhr.upload.addEventListener("progress", function(evt){
                        if (evt.lengthComputable) {
                          $('#bar').css({
                            display: 'block',
                            width: /*"(evt.loaded / evt.total * 100 )"*/ "100%"
                          });
                          /*$("#bar").style.display = 'block';
                          $("#bar").text(evt.loaded / evt.total * 100 + ' %');
                          $("#bar").animate({width: "evt.loaded / evt.total * 100 %"});*/
                        }
                      }, false);
                      //Download progress
                      //xhr.addEventListener("progress", function(evt){
                        //if (evt.lengthComputable) {
                         // $('#bar').css({
                          //  display: 'block',
                          //  width: /*"(evt.loaded / evt.total * 100 )"*/ "100%"
                         // });
                          /*$("#bar").style.display = 'block';
                          $("#bar").text(evt.loaded / evt.total * 100 + ' %');
                          $("#bar").animate({width: "evt.loaded / evt.total * 100 %"});*/
                        //}
                      //}, false);
                      return xhr;
                      },
                      error: function() {
                        alert("Data was successfuly saved to the database");
                      }
                    })

                    /* var div = document.createElement("div");

                    div.innerText = textFile.result;

                    output.insertBefore(div, null); */

                })

                //Read the text file
               
                jsonFileReader.readAsBinaryString(file);
            }

        });
    }
    else {
        console.log("Your browser does not support File API");
    }
}
