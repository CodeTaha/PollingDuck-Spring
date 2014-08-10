<%@page import="com.google.gson.Gson"%>
<% 
Cookie[] cookies = request.getCookies();
String handle="";
int uid=0;
//User_Detail user_detail;
Gson gson=new Gson();
        boolean foundCookie = false;

        for(int i = 0; i < cookies.length; i++) { 
            Cookie cookie1 = cookies[i];
            if(cookie1.getName().equals("handle"))
            {
                handle=cookie1.getValue();
                foundCookie = true;
            }
            else if(cookie1.getName().equals("uid"))
            {
                uid=Integer.parseInt(cookie1.getValue());
                foundCookie = true;
            }
            else if(cookie1.getName().equals("User_Obj"))
            {
                System.out.println(cookie1.getValue());
               // user_detail=gson.fromJson(cookie1.getValue(), User_Detail.class);
                foundCookie = true;
            }
        }  

        if (!foundCookie) {
            System.out.println("cookies not found 2");
            response.sendRedirect("index");
        }
%>
<html>
<head>
<title>form</title>
 
<script src="pages/resources/js/jquery.js"></script>
<script src="pages/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="pages/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="pages/resources/js/jquery.datetimepicker.js"></script>
  <script type="text/javascript" src="pages/resources/js/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="pages/resources/css/jquery.datetimepicker.css" >
         <link rel="stylesheet" href="pages/resources/css/jquery-ui.css" >
         <link rel="stylesheet" href="pages/resources/css/jquery-ui.theme.css" >
          <link rel="stylesheet" href="pages/resources/css/jquery-ui.structure.css" >
                   <link rel="stylesheet" href="pages/resources/css/jquery-ui.theme.css" >
           <link rel="stylesheet" href="pages/resources/css/jquery-ui.theme.min.css" >
           
<link href="pages/resources/select2/select2.css" rel="stylesheet"/>
<script src="pages/resources/select2/select2.js"></script>
</head>
<body>
<!--<h1>create poll</h1>-->
 
<script type="text/javascript">
var iq=0,ie=0,del=0;
var questions,qtypes,divqid,answer,column,row,divsqid,buttonid,buttonval,buttondelid,buttondelval,diveditid,tt,selectbutton,flag=0,diveditid,sss;
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
        $("#"+divqid).append('Question: <input type="text" name="question" id="'+questions+'"/><br/>Question Type: <select id="'+qtypes+'" onchange="createQtn()"><option>Select One</option><option value="mcss">Multiple choice Single select</option><option value="mcms">Multiple choice Multiple select</option><option value="tb">Textbox</option><option value="moc">Matrix of choices</option><option value="momc">Matrix of Multiple choices</option></select>');
    }
    function createQtn()
    {
        
         answer="answers"+iq;
         column="columns"+iq;
         row="rows"+iq;
         tt="t"+(iq+1);
        var qtype=$('#'+qtypes).val();
        //alert(qtype);
        //$("#d3").empty();
        switch(qtype)
        {
            case 'mcss':    {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">Answer choices:<textarea id="'+answer+'" ></textarea></div>');}break;
            case 'mcms':    {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">Answer choices:<textarea id="'+answer+'" ></textarea></div>');}break;
            case 'tb':      {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">A textbox will be created for the user to fill in the answer <input type="hidden" id="'+answer+'"/></div>');}break;
            case 'moc':     {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">Enter columns and rows <textarea id="'+column+'" ></textarea><textarea id="'+row+'" ></textarea></div>');}break;
            case 'momc':    {$("#t1").remove();$("#"+divqid).append('<div id="'+tt+'">Enter columns and rows <textarea id="'+column+'" ></textarea><textarea id="'+row+'" ></textarea></div>');}break;
        }
        $("#"+tt).append('<button onclick="submitQtn()">Submit Question</button>');
       
    }
    
    function submitQtn()
    {
        if(flag===1)
        {
            divsqid="divsq"+selectbutton;console.log("divsqid initail wen created with iq ");console.log(divsqid);
        buttonid="buttons"+selectbutton;
        buttonval=selectbutton;
        buttondelid="buttonsdel"+selectbutton;
        buttondelval=selectbutton;    
        }
        else
        {
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
<div id='d1'>
 Title:<input type="text" name="t1" id="title"><br/> 
 Description:<textarea name="t1" id="desc"></textarea><br/>
 
</div>
Category :<select id="category" multiple="multiple" style="width:300px;" tabindex="-1" class="select2-offscreen"></select>

<!--Category:<select id="category"><option value="1">Java</option><option value="2">Java</option><option value="3">Java</option></select>-->
<div id="datetimediv">
     Start Date  : <input type="text" id="sd" name="sd"/> 
     End Date  : <input type="text" id="ed" name="ed"/>
</div>
<div id='d2'>


</div>
<div id='d3'>


</div>
<div id='d1'>
    <button onclick="addQuestion()" id="addQuestion">Add Question</button>
    
    <input type='button'onclick="send()" value='Submit Survey' id='Submit'>
</div>



</body>
</html>



