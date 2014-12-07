<%@include file="header.jspf" %>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=555702664544677&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){
js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
</script>
</body>
            <!-- /.navbar-collapse do not change uptil here-->
            <div id="page-wrapper">
                <div class="container-fluid" id="pollList">
                <div class='row'>
                    <div class='col-sm-4'>
                           <div class='panel panel-primary'>
                                <div class='panel-heading'>
                                    <h3 class='panel-title'>Panel title</h3>
                                </div>
                                <div class='panel-body'>
                                    Panel content
                                </div>
                            </div>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-sm-4'>
                           <div class='panel panel-primary'>
                                <div class='panel-heading'>
                                    <div class='row'>
                                        <div class='col-sm-8'>
                                            <h3 class='panel-title'>Poll Title</h3>
                                        </div>
                                        <div class='col-sm-4'>
                                            <img style='width:10px;height:auto' src='pages/resources/images/pollicoins.png'> 50 
                                            <img style='width:10px;height:auto' src='pages/resources/images/bulb.png'> 50
                                        </div>
                                    </div>
                                </div>
                               
                                <div class='panel-body'>
                                    <div class='row'>
                                        <a href='#' target='blank'> <img class='img-thumbnail' style='width:50px;height:50px' src='https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpf1/v/t1.0-1/p100x100/10171238_729237357164686_2553226577218477225_n.jpg?oh=4c5334a13282b6f4053a79281a24df74&oe=5505DC4E&__gda__=1427521192_72cd9638add4d69b1f792361e7cdbbd7' alt=''>
                                            username @ handle</a>
                                    </div>
                                    <div class='row'>
                                        <div class='col-sm-7'>
                                             <span class='glyphicon glyphicon-tags' aria-hidden='true'></span> Tags: Java,PHP
                                        </div>
                                        <div class='col-sm-5'>
                                            <button type='button' class='btn btn-sm btn-primary'>Solve</button>
                                            <button type='button' class='btn btn-sm btn-success'>Report</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            </div>
            
               
                   
                    
        
        
     <!--   <div id="dialog-modal" title="Solve Poll" style="float:right">   -->
            <div id="selector1">
                <div id="dialog-modal" title="Solve Poll" >
                    
                </div>
            </div>
     <div id="NoMoreData" style="padding-bottom: 3px;">Sorry No More Polls!</div>
                   
                
           
            </div>
</div>       
  
        <script>
    var pollJSONtemp;   
    var pollJSONvp=new Array();
    var ts="";
    var canLoadMore=true;
    //var dialog=  $("#selector1").dialog({autoOpen: true,height: 550,width: 830,modal: true});
    var dialog;
    $(document).ready(function(){
                
                 loadData();
               dialog=$( "#selector1").dialog({autoOpen: false,show: {effect: "clip",duration: 10},hide: {effect: "fade",duration: 1000},close : function() {
           $( "#dialog-modal" ).empty();
          //location.reload(true);
       }});
            });
            function loadData()
            {
                if(canLoadMore)
                {
                $.ajax({
           type: "POST",       // the dNodeNameefault
           url: "viewPollsData",
           data: {ts:ts },
           success: function(data){
               
               console.log(data);
               pollJSONtemp=null;
               pollJSONtemp=JSON.parse(data);
               console.log("pollJSONtemp");
               console.log(pollJSONtemp);
               if(pollJSONtemp==[] || pollJSONtemp==null || pollJSONtemp=="")
               {
                   console.log("end of data reached");
                   canLoadMore=false;
                   
                   
               }
               else
               {
               ts=pollJSONtemp[pollJSONtemp.length-1]['start_ts'];
               console.log("ts="+ts);
               
               createPollDivs();
                 //alert(data);
             }
                   
            }
            });
    }
    
            }
            $(window).scroll(function()
                {
                    if(($(window).scrollTop() === $(document).height() - $(window).height()) && canLoadMore==true)
                    {
                        console.log("Ajax scroll working");
                        loadData();
                    }
                });
            function createPollDivs()
            {
                for(var i=0; i<pollJSONtemp.length;i++)
                     { var tags=pollJSONtemp[i]["cat_list"][0]["category_name"];
                         pollJSONvp.push(pollJSONtemp[i]);
                         for(var j=1;j<pollJSONtemp[i]["cat_list"].length;j++)
                         {
                           tags=tags+", "+pollJSONtemp[i]["cat_list"][j]["category_name"];
                         }
                        
                         $("#pollList").append("<div class='row'>\n\
                    <div class='col-sm-4'>\n\
                           <div class='panel panel-primary'>\n\
                                <div class='panel-heading' >\n\
                                    <div class='row'>\n\
                                        <div class='col-sm-8'>\n\
                                            <h3 class='panel-title'>"+pollJSONtemp[i]["pid"]+":"+pollJSONtemp[i]["title"]+"</h3>\n\
                                        </div>\n\
                                        <div class='col-sm-4'>\n\
                                            <img style='width:10px;height:auto' src='pages/resources/images/pollicoins.png'> "+pollJSONtemp[i]["reward"]+" \n\
                                            <img style='width:10px;height:auto' src='pages/resources/images/bulb.png'> "+pollJSONtemp[i]["reward"]+"\n\
                                        </div>\n\
                                    </div>\n\
                                </div>\n\
                               \n\
                                <div class='panel-body' >\n\
                                    <div class='row'>\n\
                                        <a href='profile/"+pollJSONtemp[i]["user"]["handle"]+"' target='blank'><img class='img-thumbnail' style='width:50px;height:50px' src='"+pollJSONtemp[i]["user"]["profile_pic"]+"' alt='"+pollJSONtemp[i]["user"]["handle"]+"'>\n\
                                            "+pollJSONtemp[i]["user"]["name"]+" @ "+pollJSONtemp[i]["user"]["handle"]+"</a>\n\
                                    </div>\n\
                                    <div class='row'>\n\
                                        <div class='col-sm-7'>\n\
                                             <span class='glyphicon glyphicon-tags' aria-hidden='true'></span> Tags: "+tags+"<p><br></p>\n\
                                        </div>\n\
                                        <div class='col-sm-10'>\n\
                                        <button type='button' class='btn btn-sm btn-primary' onclick='openPoll("+parseInt(pollJSONtemp[i]["pid"])+")'>Solve</button>\n\
                                        <div class='fb-share-button' data-href='http://localhost:8080/Pollican/solvePoll/"+parseInt(pollJSONtemp[i]["pid"])+"/' data-layout='button'></div>  \n\
<a href='twitter.com/share' data-text='Solve this awesome Poll!!!' data-url='http://localhost:8080/Pollican/solvePoll/"+parseInt(pollJSONtemp[i]["pid"])+"/' class='twitter-share-button' data-via='pollican' data-lang='en' >Tweet</a>\n\
 <button type='button' class='btn btn-sm btn-success' onclick='pollResult("+parseInt(pollJSONtemp[i]["pid"])+")'>Report</button>\n\
                                        </div>\n\
                                    </div>\n\
                                </div>\n\
                            </div>\n\
                    </div>\n\
                </div>");
            //    <button type='button' class='btn btn-sm btn-info' onclick='share("+parseInt(pollJSONtemp[i]["pid"])+")'>Share</button>\n\
                                    
                     //localhost:8080/Pollican/solvePoll/"+parseInt(pollJSONtemp[i]["pid"])+"
                    /*$("#pollList").append('<hr><div id="pid'+pollJSONtemp[i]["pid"]+'">\n\
                      <h3>'+pollJSONtemp[i]["pid"]+":"+pollJSONtemp[i]["title"]+'</h3>\n\
                         \n\<a href="/Pollican/profile/'+pollJSONtemp[i]["user"]["handle"]+'"><img width="50" height = "50" src='+pollJSONtemp[i]["user"]["profile_pic"]+"></a>  <a href='/Pollican/profile/"+pollJSONtemp[i]["user"]["handle"]+"'>"+pollJSONtemp[i]["user"]["name"]+"</a>  <a href='/Pollican/profile/"+pollJSONtemp[i]["user"]["handle"]+"'  >@"+pollJSONtemp[i]["user"]["handle"]+'</a>\n\
                          \n\<h4>'+pollJSONtemp[i]["description"] +'</h4><h5>REWARD :'+pollJSONtemp[i]["reward"]+'</h5></div>'
                          );
                  $("#pid"+pollJSONtemp[i]["pid"]).append("<b><i>TAGS</i></b> :  ");
                         for(var j=0;j<pollJSONtemp[i]["cat_list"].length;j++)
                           $("#pid"+pollJSONtemp[i]["pid"]).append('<b>'+pollJSONtemp[i]["cat_list"][j]["category_name"]+"</b> ");
                         $("#pid"+pollJSONtemp[i]["pid"]).append('<br><button onclick="openPoll('+parseInt(pollJSONtemp[i]["pid"])+')">Take Poll</button>');
                         $("#pid"+pollJSONtemp[i]["pid"]).append('<button onclick="pollResult('+parseInt(pollJSONtemp[i]["pid"])+')">Results</button>');
                      */
                         
                     }
            }
           function openPoll(i)
       {
           var poll_js=pollJSONvp;
          // alert();
           //$("#dialog-modal").empty();
           var ind;
           console.log('pollJSONvp=');
           console.log(pollJSONvp)
           for(k=0; k<pollJSONvp.length; k++)
           {//console.log(pollJSONvp[k])
               if(pollJSONvp[k]['pid']===i)
               {
                   ind=k;
                   console.log("k="+k);
                   break;
               }
           }
          
                 
               var pollJson_obj=pollJSONvp[ind];
               console.log("In OpenPoll");
               console.log(pollJson_obj);
               var poll_js=pollJSONvp;
              
       dialog.dialog( "open" );
       $( "#dialog-modal" ).load( "solvePoll", { pid: pollJson_obj['pid'], obj:JSON.stringify(pollJson_obj), fn:1} ); 
       
   
   pollJSONvp=poll_js;
            }
           function pollResult(pid)
           {
                var win = window.open("result/"+pid, '_blank');
                win.focus();
                /*$( "#dialog-modal").empty().load( 'pollResult.jsp', {pid: pid}, function( response, status, xhr ) {
                if ( status === "error" ) {
                var msg = "Sorry but there was an error: ";
                $( "#dialog-modal" ).html( msg + xhr.status + " " + xhr.statusText );*/
            }
           
        </script>
           
    
</html>