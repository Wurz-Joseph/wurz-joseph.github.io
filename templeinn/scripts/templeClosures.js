$.ajax({
   url: 'scripts/temples.json',
   dataType: 'json',
   cache: false,
   success: function (data) {
      $(data.temples).each(function (i, value) {
         var name = data.temples[i].name;
         var closure = data.temples[i].closures;


         if (name == "Dallas") {

            $.each(closure, function(i, closure) {
               $('#temple1').append("<li>"+ closure + "</li>")
           });

         }

         if (name == "Frankfurt") {
            
            $.each(closure, function(i, closure) {
               $('#temple2').append("<li>"+ closure + "</li>")
           });
         }

         if (name == "Guadalajara") {
            $.each(closure, function(i, closure) {
               $('#temple3').append("<li>"+ closure + "</li>")
           });
         }

         if (name == "San Diego") {
            $.each(closure, function(i, closure) {
               $('#temple4').append("<li>"+ closure + "</li>")
           });
         }

      });
   }
});
