$(document).ready(function() {
   var $udialog = $('<div id="udialog" style="width:300px"></div>')
                      .html('<img src="/images/spinner.gif"/>')
                      .dialog({ autoOpen: false, title: 'Unicode', minWidth: 400 });
   var $gdialog = $('<div id="gdialog" style="width:300px"></div>')
                      .html('<img src="/images/spinner.gif"/>')
                      .dialog({ autoOpen: false, title: 'Glyph', minWidth: 400 });
   var $kdialog = $('<div id="kdialog" style="width:300px"></div>')
                      .html('<img src="/images/spinner.gif"/>')
                      .dialog({ autoOpen: false, title: 'Class', minWidth: 400});
   $("#font-tabs").tabs({cache:true, spinner: 'Loading...',
                        load:function(event, ui) {

                            $(".category select").live('change', function(){
                                                             if (this.value=='') {
                                                                 var category_name = prompt("Input Category Name", '');
                                                                 $(this).prepend('<option value="' + category_name + '">' + category_name + '</option>');
                                                                 $(this).val(category_name);
                                                             }
                                                         });
                            $("a.unicode").click(function() {
                               $udialog.html('<img src="/images/spinner.gif"/>').dialog('open');
                               return true;
                            });
                            $("a.glyph").live('click', function() {
                               $gdialog.html('<img src="/images/spinner.gif"/>').dialog('open');
                               return true;
                            });
                            $("a.klass").live('click', function() {
                               $kdialog.html('<img src="/images/spinner.gif"/>').dialog('open');
                               return true;
                            });
                            $("a.lookup").live('click', function() {
                               $("#udialog").dialog("close");
                               $("#gdialog").dialog("close");
                               $("#kdialog").dialog("close");
                               $("#font-tabs").tabs('select', 0);
                               return false;
                            });
                            $("#class-list").accordion({ collapsible: true, header: "h3", active: false, autoHeight: false}); 
                            $("#font-editor").dialog();
                            $(".file-list").tabs({cache:true, load: function(){ $('#rendered-accordion').accordion({ collapsible: true, header: "h3", active: false, autoHeight: false});  } }).addClass('ui-tabs-vertical-wide ui-helper-clearfix');
   $(".file-list li").removeClass('ui-corner-top').addClass('ui-corner-left');
                        }});
   $(".feature-lookups").accordion({ collapsible: true, header: "h3", active: false, autoHeight: false}); 


   $(".lookup-list").tabs().addClass('ui-tabs-vertical ui-helper-clearfix');
   $(".lookup-list li").removeClass('ui-corner-top').addClass('ui-corner-left');

});


