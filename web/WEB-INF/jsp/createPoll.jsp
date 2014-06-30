<html>
<head>
<title>form</title>
 
<script src="pages/resources/js/jquery.min.js"></script>
<link href="pages/resources/select2/select2.css" rel="stylesheet"/>
    <script src="pages/resources/select2/select2.js"></script>
</head>
<body>
<!--<h1>create poll</h1>-->
 
<script type="text/javascript">

var detailArray=new Array();
var qtnArray= new Array();
var ansArray= new Array();
var count=0;
var uid=1;
console.log(${cat_list});
var cat_json=${cat_list};
console.log(cat_json[0]['cid']);
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
  maximumSelectionSize:5,
  //allowClear: true,
  //tags: cat_list//[{id: 0, text: 'story'},{id: 1, text: 'bug'},{id: 2, text: 'task'}]
});

  });
  
  function addQuestion()
    {//console.log($("#category").val());
        $("#addQuestion").prop("disabled", true);
        $("#d3").append('Question: <input type="text" name="question" id="question"/><br/>Question Type: <select id="Qtype" onchange="createQtn()"><option>Select One</option><option value="mcss">Multiple choice Single select</option><option value="mcms">Multiple choice Multiple select</option><option value="tb">Textbox</option><option value="moc">Matrix of choices</option><option value="momc">Matrix of Multiple choices</option></select>');
    }
    function createQtn()
    {
        var qtype=$('#Qtype').val();
        //alert(qtype);
        //$("#d3").empty();
        switch(qtype)
        {
            case 'mcss':    {$("#t1").remove();$("#d3").append('<div id="t1">Answer choices:<textarea id="answers" ></textarea></div>');}break;
            case 'mcms':    {$("#t1").remove();$("#d3").append('<div id="t1">Answer choices:<textarea id="answers" ></textarea></div>');}break;
            case 'tb':      {$("#t1").remove();$("#d3").append('<div id="t1">A textbox will be created for the user to fill in the answer <input type="hidden" id="answers"/></div>');}break;
            case 'moc':     {$("#t1").remove();$("#d3").append('<div id="t1">Enter columns and rows <textarea id="columns" ></textarea><textarea id="rows" ></textarea></div>');}break;
            case 'momc':    {$("#t1").remove();$("#d3").append('<div id="t1">Enter columns and rows <textarea id="columns" ></textarea><textarea id="rows" ></textarea></div>');}break;
        }
        $("#t1").append('<button onclick="submitQtn()">Submit Question</button>');
    }
    
    function submitQtn()
    {
        var question=$('#question').val();
        var qtype=$('#Qtype').val();
        var qtnArray2=new Array();
        //qtnArray[count]=new Array(6);
        qtnArray2[0]=count+1;
        qtnArray2[1]=count+1;
        qtnArray2[2]=qtype;
        qtnArray2[3]=question;
        
        if(qtype==="moc" || qtype==="momc")
        {
            var columns=$('#columns').val();
            var rows=$('#rows').val();
          
        qtnArray2[4]=JSON.stringify(rows.split("\n"));
        qtnArray2[5]=JSON.stringify(columns.split("\n"));
        
        
  
        $("#d2").append("Question:"+question+"<br/>Type: "+qtype+"<br>Columns: "+columns+"<br>rows:"+rows);
        }
        else
        {
        var answers=$('#answers').val();
        qtnArray2[4]=JSON.stringify(answers.split("\n"));
        qtnArray2[5]="";
        
        $("#d2").append("Question:"+question+"<br/>Type: "+qtype+"<br>Options:"+answers);
        }
        console.log("qtnArray2=");
        console.log(qtnArray2);
        qtnArray.push(qtnArray2);
        console.log(qtnArray);
        $("#d3").empty();
        var json=JSON.stringify(qtnArray);
        console.log(json);
        count++;
        
        
        $("#addQuestion").prop("disabled", false);
        
            
    }
    function send()
    {
        detailArray[0]=uid;
        detailArray[1]=$("#title").val();
        detailArray[2]=$("#desc").val();
        var category_temp=$("#category").val();
        detailArray[3]=category_temp[0];
        for(var i=1; i<category_temp.length;i++)
        {
        detailArray[3]=detailArray[3]+","+category_temp[i];    
        }
        //detailArray[3]=$("#category").val();
        
        detailArray[4]=count;
        var detailJSON=JSON.stringify(detailArray);
        var qtnJSON=JSON.stringify(qtnArray);
        //var ansJSON=JSON.stringify(ansArray);
        console.log("sending complete Poll");
        console.log(detailJSON);
        console.log(qtnArray);
        //console.log(ansArray);
       $.ajax({
           type: "POST",       // the dNodeNameefault
           url: "submitPollData",
           data: { detailJSON:detailJSON, qtnJSON:qtnJSON},
           success: function(data){
               console.log(data);
               if (data)
               {  alert('successful');
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



