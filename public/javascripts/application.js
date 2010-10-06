$(document).ready(function() {
   var $udialog = $('<div id="udialog" style="width:300px"></div>')
                      .html('<img src="/images/spinner.gif"/>')
                      .dialog({
                              autoOpen: false,
                              title: 'Unicode'
                              });
   var $gdialog = $('<div id="gdialog" style="width:300px"></div>')
                      .html('<img src="/images/spinner.gif"/>')
                      .dialog({
                              autoOpen: false,
                              title: 'Glyph'
                              });
   $("#font-tabs").tabs({cache:true, spinner: 'Loading...',
                        load:function(event, ui) {
                            $("a.unicode").click(function() {
                               $udialog.html('<img src="/images/spinner.gif"/>').dialog('open');
                               return true;
                            });
                            $("a.glyph").live('click', function() {
                               $gdialog.html('<img src="/images/spinner.gif"/>').dialog('open');
                               return true;
                            });
                            $("a.klass").live('click', function() {
                               $("#font-tabs").tabs('select', 1);       
                               return false;
                            });
                            $("a.lookup").live('click', function() {
                               $("#font-tabs").tabs('select', 0);       
                               return false;
                            });
                            $("#class-list").accordion({ collapsible: true, header: "h3", active: false, autoHeight: false}); 
                            $("#font-editor").dialog();
                            $(".file-list").tabs({cache:true}).addClass('ui-tabs-vertical-wide ui-helper-clearfix');
   $(".file-list li").removeClass('ui-corner-top').addClass('ui-corner-left');
                        }});
   $(".feature-lookups").accordion({ collapsible: true, header: "h3", active: false, autoHeight: false}); 


   $(".lookup-list").tabs().addClass('ui-tabs-vertical ui-helper-clearfix');
   $(".lookup-list li").removeClass('ui-corner-top').addClass('ui-corner-left');

});