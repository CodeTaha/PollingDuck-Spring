
<%@include file="header.jspf" %>

      

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12 form-horizontal">
                        <h1 class="page-header">
                            Create Poll
                        </h1>
                        <!-- <div class="form-group">
            <label class="control-label col-sm-2" for="name">Name:</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="name" placeholder="Enter your FullName">
            </div>
        </div>-->
                        <div id='d1'>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="name">Title:</label>
                                <div class="col-sm-6">
                                <input type="text" class="form-control" id="title" placeholder="Enter a Relevant Title">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="name">Description:</label>
                                <div class="col-sm-6">
                                <textarea class="form-control" id="desc" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="name">Tag Categories:</label>
                                <div class="col-sm-6">
                                <select id="category" multiple="multiple" tabindex="-1" class="select2-offscreen"></select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="name">Start Time:</label>
                                <div class="col-sm-2">
                                <input type="text" class="form-control" id="sd" name="sd"/>
                                </div>
                                <label class="control-label col-sm-2" for="name">End Time:</label>
                                <div class="col-sm-2">
                                <input type="text" class="form-control" id="ed" name="ed"/>
                                </div>
                            </div>
                           
                        </div>
                        <div id='d2'>


                        </div>
                        <div id='d3'>
                            <!--<div class='panel panel-info'>
                                <div class='panel-heading'>
                                        <h3 class='panel-title'>Add Question</h3>
                                </div>
                                <div class='panel-body'>
                                    <div class='form-group'>
                                        <label class='control-label col-sm-2' for='name'>Question:</label>
                                        <div class='col-sm-6'>
                                        <input type='text' class='form-control' name='question' id='qtnid' placeholder='Type a Question'>
                                        </div>
                                    </div>
                                    <div class='form-group'>
                                        <label class='control-label col-sm-2' for='name'>Question Type:</label>
                                        <div class='col-sm-6'>
                                        <select id='' onchange='' class='form-control'>
                                            <option value='no_questiontype'>Select One</option>
                                            <option value='mcss'>Multiple choice Single select</option>
                                            <option value='mcms'>Multiple choice Multiple select</option>
                                            <option value='tb'>TextBox</option>
                                            <option value='moc'>Matrix of choices</option>
                                            <option value='momc'>Matrix of Multiple choices</option>
                                        </select>
                                        </div>
                                    </div>
                                </div>
                            </div>-->
                        </div>
                        <div>
                            <button class="btn btn-primary" onclick="addQuestion()" id="addQuestion">Add Question</button>

                            <input class="btn btn-success" type='button'onclick="send()" value='Submit Survey' id='Submit'>
                        </div>
                    </div>
                </div>
                

                 
                             
                                 
                                </div>
                            </div>
</div>
 

<script type="text/javascript">
var iq=0,ie=0,del=0,ttval=0,mapper=0,editmapper=0;
var questions,qtypes,divqid,answer,column,row,divsqid,buttonid,buttonval,buttondelid,buttondelval,diveditid,tt,selectbutton,flag=0,diveditid,sss,flag1=0;
var detailArray=new Array();
var qtnArray= new Array();
var ansArray= new Array();
var deltrackArray= new Array();
var count=0;
var uid=<%=uid%>;
console.log(${cat_list});
var cat_json=${cat_list};
var cat_list=new Array();
$(document).ready(function(){
   for(var i=0; i<cat_json.length; i++)
   {
       cat_list.push({id:cat_json[i]['cid'], text:cat_json[i]['category_name']});
       $("#category").append("<option value="+cat_json[i]['cid']+">"+cat_json[i]['category_name']+"</option>");
   }
    $("#category").select2({
       // multiple: true,
  placeholder:"tag poll categories",
  maximumSelectionSize:5
  //allowClear: true,
  //tags: cat_list//[{id: 0, text: 'story'},{id: 1, text: 'bug'},{id: 2, text: 'task'}]
});
     $("#sd").datetimepicker(
      /*   showMinute: true,
           showSecond: true,
           timeFormat: 'hh:mm:ss',
           dateFormat:"mm/dd/yy" */
                   );
      $("#ed").datetimepicker(
         /*   showMinute: true,
           showSecond: true,
           timeFormat: 'hh:mm:ss',
           dateFormat:"mm/dd/yy" */
                   );
  });
  
  function addQuestion()
    {//console.log($("#category").val());
        iq++;ie++; console.log("ie value in addqtn");console.log(ie);
         divqid="divq"+iq;
         questions="question"+iq;
         qtypes="Qtype"+iq;
        $("#addQuestion").prop("disabled", true);
        $("#d3").append('<div id="'+divqid+'"></div>');
        $("#"+divqid).append("<div class='panel panel-info'>\n\
                                <div class='panel-heading'>\n\
                                        <h3 class='panel-title'>Add Question</h3>\n\
                                </div>\n\
                                <div class='panel-body'>\n\
                                    <div class='form-group'>\n\
                                        <label class='control-label col-sm-2' for='name'>Question:</label>\n\
                                        <div class='col-sm-6'>\n\
                                        <input type='text' class='form-control' name='question' id='"+questions+"' placeholder='Type a Question'>\n\
                                        </div>\n\
                                    </div>\n\
                                    <div class='form-group'>\n\
                                        <label class='control-label col-sm-2' for='name'>Question Type:</label>\n\
                                        <div class='col-sm-6'>\n\
                                        <select id='"+qtypes+"' onchange='selector();' class='form-control' placeholder='Select One'>\n\
                                            <option value='no_questiontype'>Select One</option>\n\
                                            <option value='mcss'>Multiple choice Single select</option>\n\
                                            <option value='mcms'>Multiple choice Multiple select</option>\n\
                                            <option value='tb'>TextBox</option>\n\
                                            <option value='moc'>Matrix of choices</option>\n\
                                            <option value='momc'>Matrix of Multiple choices</option>\n\
                                        </select>\n\
                                        </div>\n\
                                    </div>\n\
                                </div>\n\
                            </div>");
                //append('Question: <input type="text" name="question" id="'+questions+'"/><br/>Question Type: <select id="'+qtypes+'" onchange="selector()"><option value="no_questiontype">Select One</option><option value="mcss">Multiple choice Single select</option><option value="mcms">Multiple choice Multiple select</option><option value="tb">Textbox</option><option value="moc">Matrix of choices</option><option value="momc">Matrix of Multiple choices</option></select>');
    }
    
    function selector()
    {
        if(flag==1)
            editmapper++;
        else
        mapper++;
        createQtn();
        
    }
    function createQtn()
    {
        
         answer="answers"+iq;
         column="columns"+iq;
         row="rows"+iq;
              
           tt="t"+(iq+1);
           ttval=iq+1;
        if(flag==1)
         {
             var qtype=$('#Qtype'+selectbutton).val();
            // var tee="t"+(parseInt(selectbutton)+1);
             var te="t"+(parseInt(selectbutton)+1);
              answer="answers"+selectbutton;
         column="columns"+selectbutton;
         row="rows"+selectbutton;
        
         }
         else
         {    
            var qtype=$('#'+qtypes).val();
         }
         ////alert(qtype);
        //$("#d3").empty();
        
        if(flag==1)
        {
            if(editmapper>=1)
           {      
           switch(qtype)
           {
            case 'mcss':    {$("#t1").remove();$("#"+te).remove();$("#divq"+selectbutton).append('<div id="'+te+'">Answer choices:<textarea id="'+answer+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'mcms':    {$("#t1").remove();$("#"+te).remove();$("#divq"+selectbutton).append('<div id="'+te+'">Answer choices:<textarea id="'+answer+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'tb':      {$("#t1").remove();$("#"+te).remove();$("#divq"+selectbutton).append('<div id="'+te+'">A textbox will be created for the user to fill in the answer <input type="hidden" id="'+answer+'"/></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'moc':     {$("#t1").remove();$("#"+te).remove();$("#divq"+selectbutton).append('<div id="'+te+'">Enter columns and rows <textarea id="'+column+'" ></textarea><textarea id="'+row+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'momc':    {$("#t1").remove();$("#"+te).remove();$("#divq"+selectbutton).append('<div id="'+te+'">Enter columns and rows <textarea id="'+column+'" ></textarea><textarea id="'+row+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'no_questiontype' :  {$("#t1").remove();$("#"+te).remove();alert("please select a question type");$("#submitqtn").prop("disabled",true);}break;
           }   
           if(qtype!='no_questiontype')
           { 
               
             $("#"+te).append('<button id="submitqtn" onclick="submitQtn()">Submit Question</button>');  
           }
                
           }
        }
        else
        {     
            if(mapper==1)
          {       
         switch(qtype)
        {
            case 'mcss':    {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">Answer choices:<textarea id="'+answer+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'mcms':    {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">Answer choices:<textarea id="'+answer+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'tb':      {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">A textbox will be created for the user to fill in the answer <input type="hidden" id="'+answer+'"/></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'moc':     {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">Enter columns and rows <textarea id="'+column+'" ></textarea><textarea id="'+row+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'momc':    {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">Enter columns and rows <textarea id="'+column+'" ></textarea><textarea id="'+row+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
             case 'no_questiontype' :  {$("#t1").remove();alert("please select a question type");$("#submitqtn").prop("disabled",true);}break;
         }
         if(qtype!='no_questiontype')
           { 
             
          $("#"+tt).append('<button id="submitqtn" onclick="submitQtn()">Submit Question</button>');
           } 
                
         }
          else
          {
         
         switch(qtype)
        {
            case 'mcss':    {$("#t1").remove();$("#"+tt).remove();$("#"+divqid).append('<div id="'+tt+'">Answer choices:<textarea id="'+answer+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'mcms':    {$("#t1").remove();$("#"+tt).remove();$("#"+divqid).append('<div id="'+tt+'">Answer choices:<textarea id="'+answer+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'tb':      {$("#t1").remove();$("#"+tt).remove();$("#"+divqid).append('<div id="'+tt+'">A textbox will be created for the user to fill in the answer <input type="hidden" id="'+answer+'"/></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'moc':     {$("#t1").remove();$("#"+tt).remove();$("#"+divqid).append('<div id="'+tt+'">Enter columns and rows <textarea id="'+column+'" ></textarea><textarea id="'+row+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
            case 'momc':    {$("#t1").remove();$("#"+tt).remove();$("#"+divqid).append('<div id="'+tt+'">Enter columns and rows <textarea id="'+column+'" ></textarea><textarea id="'+row+'" ></textarea></div>');$("#submitqtn").prop("disabled",false);}break;
             case 'no_questiontype' :  {$("#t1").remove();$("#"+tt).remove();alert("please select a question type");$("#submitqtn").prop("disabled",true);}break;
                
        } 
        if(qtype!='no_questiontype')
           {  
               
           
                $("#"+tt).append('<button id="submitqtn" onclick="submitQtn()">Submit Question</button>');
           } 
                
                
                
         }
         } 
         // $("#"+qtypes).prop("disabled",true);
         console.log("ttval value: ");console.log(tt);
        
       
    }
    
    function submitQtn()
    {
       
        if(flag===1)
        {
            editmapper=0;
            flag1=1;
            divsqid="divsq"+selectbutton;console.log("divsqid initail wen created with iq ");console.log(divsqid);
        buttonid="buttons"+selectbutton;
        buttonval=selectbutton;
        buttondelid="buttonsdel"+selectbutton;
        buttondelval=selectbutton;    
        }
        else
        {
            mapper=0;
        divsqid="divsq"+iq;console.log("divsqid initail wen created with iq ");console.log(divsqid);
        buttonid="buttons"+iq;
        buttonval=iq;
        buttondelid="buttonsdel"+iq;
        buttondelval=iq;
       }
    console.log("buttonval");
          console.log(buttonval);
       // diveditid="diveditid"+iq;
       if(flag===1)
       {
           var question=$("#question"+selectbutton).val();
           var qtype=$("#Qtype"+selectbutton).val();
       }
       else
       {
        var question=$("#"+questions).val();
        var qtype=$("#"+qtypes).val();
       }
            var qtnArray2=new Array();
        //qtnArray[count]=new Array(6);
        if(flag===1)
        {
            qtnArray2[0]=selectbutton;
        }
        else
        {
        qtnArray2[0]=count+1;
        }
        qtnArray2[1]=count+1;
        qtnArray2[2]=qtype;
        qtnArray2[3]=question;
        
        $("#d2").append('<div id="'+divsqid+'"></div>');
        if(qtype==="moc" || qtype==="momc")
        {
           if(flag===1)
           {
              
                    
               var columns=$('#columns'+selectbutton).val();
                var rows=$('#rows'+selectbutton).val();
               
        qtnArray2[4]=JSON.stringify(rows.split("\n"));
        qtnArray2[5]=JSON.stringify(columns.split("\n"));
        
        
  
        $("#divsq"+selectbutton).append("Question:"+question+"<br/>Type: "+qtype+"<br>Columns: "+columns+"<br>rows:"+rows);
           }
           
            
            else
            {
            
            var columns=$('#'+column).val();
            var rows=$('#'+row).val();
          
        qtnArray2[4]=JSON.stringify(rows.split("\n"));
        qtnArray2[5]=JSON.stringify(columns.split("\n"));
        
        
  
        $("#"+divsqid).append("Question:"+question+"<br/>Type: "+qtype+"<br>Columns: "+columns+"<br>rows:"+rows);
        
            } 
        }
        else
        {
           if(flag===1)
           {
                   
                var answers=$("#answers"+selectbutton).val();
               
              qtnArray2[4]=JSON.stringify(answers.split("\n"));
        qtnArray2[5]="";
        
        $("#divsq"+selectbutton).append("Question:"+question+"<br/>Type: "+qtype+"<br>Options:"+answers);
           }
            
            else
            {
              var answers=$("#"+answer).val();
                qtnArray2[4]=JSON.stringify(answers.split("\n"));
                 qtnArray2[5]="";
        
               $("#"+divsqid).append("Question:"+question+"<br/>Type: "+qtype+"<br>Options:"+answers);
        
            }
            
         }
        console.log("qtnArray2=");
        console.log(qtnArray2);
        
        if(flag===1)
        {
            qtnArray.splice(selectbutton-1,1);
            qtnArray.splice(selectbutton-1,0,qtnArray2);
        }
        else
        {
        qtnArray.push(qtnArray2);
        count++;
        }
    console.log(qtnArray);
        
        if(flag===1)
        {
            //$("#"+sss).
            //$("#"+diveditid);
        $("#divq"+selectbutton).hide();
        }
        else
        {
            $("#"+divqid).hide();
        }
            var json=JSON.stringify(qtnArray);
        console.log(json);
        //count++;
        
        
        $("#addQuestion").prop("disabled", false);
        
        
        if(flag===1)
        {
            //var butn="buttons"+selectbutton;
            $("#divsq"+selectbutton).append('<button id="'+buttonid+'" value="'+buttonval+'" onclick="editQtn(id)">edit Question</button>');
            $("#divsq"+selectbutton).append('<button id="'+buttondelid+'" value="'+buttondelval+'" onclick="deleteQtn(id)">delete Question</button>');
            flag=0
           
            for(var i=1;i<=iq;i++)
        {
            if(i!=selectbutton)
            {
                $("#buttons"+i).prop("disabled", false);
            }
        }
        }
        else
        {
        $("#"+divsqid).append('<button id="'+buttonid+'" value="'+buttonval+'" onclick="editQtn(id)">edit Question</button>');
        $("#"+divsqid).append('<button id="'+buttondelid+'" value="'+buttondelval+'" onclick="deleteQtn(id)">delete Question</button>');
        flag=0;
        var edit = "divedit"+ie;
         $("#d2").append('<div id="'+edit+'"></div>');
        }
        
        console.log("ie value in submitqtn");console.log(ie);
    }
    
    function editQtn(id)
    {
        flag=1;
      
        console.log("ie value in editqtn");console.log(ie);
        selectbutton=document.getElementById(id).value;
       console.log("value of selected button");
       console.log(selectbutton); 
        diveditid="divedit"+selectbutton;
        sss="divsq"+selectbutton;
      
      $("#"+sss).empty();
        console.log("divsqid"); console.log(sss);
      
        
        console.log(diveditid);
        $("#"+diveditid).append( $("#divq"+selectbutton).show());
      
        console.log("iq =  "+iq)
        for(var i=1;i<=iq;i++)
        {
            if(i!=selectbutton)
            {
                $("#buttons"+i).prop("disabled", true);
            }
        }
    }
    
    function deleteQtn(id)
    {
        var selectbuttondel=document.getElementById(id).value;
        deltrackArray[del]=selectbuttondel-1;
        del++;
        $("#divsq"+selectbuttondel).remove();
         qtnArray.splice(selectbuttondel-1,1);
          qtnArray.splice(selectbuttondel-1,0,"del");
        
        
    }
    function send()
    {
        deltrackArray=deltrackArray.sort();
        console.log("delTrackArray contains id");console.log(deltrackArray);
        detailArray[0]=uid;
        detailArray[1]=$("#title").val();
        detailArray[2]=$("#desc").val();
        var category_temp=$("#category").val();
        console.log(category_temp);
        detailArray[3]=category_temp[0];
        for(var i=1; i<category_temp.length;i++)
        {
        detailArray[3]=detailArray[3]+","+category_temp[i];    
        }
        //detailArray[3]=$("#category").val();
        
        detailArray[4]=count;
        for(var i=0;i<deltrackArray.length;i++)
        {
            var xdel=deltrackArray[i];
            console.log("xdel");console.log(xdel);
            qtnArray.splice(xdel,1);
            for(var j=i+1;j<deltrackArray.length;j++)
            {
                deltrackArray[j]=deltrackArray[j]-1;
            }
        }
       // qtnArray.splice(xdel-1,1);
        var detailJSON=JSON.stringify(detailArray);
        var qtnJSON=JSON.stringify(qtnArray);
        //var ansJSON=JSON.stringify(ansArray);
        console.log("sending complete Poll");
        console.log(detailJSON);
        console.log(qtnArray);
        var sd=$("#sd").val();
      //  var startdate=new Date(sd).getTime();
        var ed=$("#ed").val();
      //  var enddate=new Date(ed).getTime();
        alert(sd);
        alert(ed);
        //console.log(ansArray);
        //, std:startdate,etd:enddate
        console.log("alia bhatt details "+detailJSON);
         console.log("alia bhatt qtns "+qtnJSON);
           console.log("alia bhatt start "+sd+" end "+ed+" uid "+uid+" hhahhha ");
        $.ajax({
           type: "POST",       // the dNodeNameefault
           url: "submitPollData",
           data: { detailJSON:detailJSON, qtnJSON:qtnJSON ,start:sd,end:ed,uid:uid },
           success: function(data){
               console.log(data);
               if (data)
               {  alert('Your Poll has been created Successfully');
                   window.location.reload();
               }   
               else 
               {alert('unsuccesful');
                }
            }
            });
    
   
    
    }
   
            
            
    
    
    
</script>



</body>
</html>



