$(document).ready(function() {
   $("#font-tabs").tabs({cache:true, spinner: 'Loading...',
                        load:function(event, ui) { 
                            $("#class-list").accordion({ collapsible: true, header: "h3", active: false, autoHeight: false}); 
                            $("#font-editor").dialog();
                        }});
   $(".feature-lookups").accordion({ collapsible: true, header: "h3", active: false, autoHeight: false}); 
   $(".feature-lookups a").attr('target', '_blank');
});