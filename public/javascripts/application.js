$(document).ready(function() {
   $("#font-tabs").tabs({cache:true, spinner: 'Loading...',
                        load:function(event, ui) { 
                            $("#class-list").accordion({ collapsible: true, header: "h3", active: false, autoHeight: false}); 
                            $("#font-editor").dialog();
                            $(".file-list").tabs({cache:true}).addClass('ui-tabs-vertical-wide ui-helper-clearfix');
   $(".file-list li").removeClass('ui-corner-top').addClass('ui-corner-left');
                        }});
   $(".feature-lookups").accordion({ collapsible: true, header: "h3", active: false, autoHeight: false}); 


   $(".lookup-list").tabs().addClass('ui-tabs-vertical ui-helper-clearfix');
   $(".lookup-list li").removeClass('ui-corner-top').addClass('ui-corner-left');
});