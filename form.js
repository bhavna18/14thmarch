$(document).ready(function (){
    

    
    
    
   currdate=new Date();
    
    //console.log(currdate);
    diff= currdate.getYear()-21;
      console.log(diff);
    maxdate = new Date(diff,0,1);
    
    //$('input[type="date"]').attr('min','')
    
    $.datepicker.setDefaults({
        dateFormat: 'dd-mm-yyyy',
       // minDate:'1-1-1980',
        maxDate: maxdate

    });
    
    $("input[type=file]").change(function (){ //input having the attribute is in square bracs
        console.log("file uploaded");
       // console.log($(this));
        
        readURL(this);
    });
    
   function readURL(input)
    {
     if(input.files && input.files[0])
         {
             var reader  = new FileReader();
            // reader.readAsDataURL(input.files[0]);
             reader.onload=function(e){
                 window.sessionStorage.setItem('photo',e.target.result);
                $('#image_upload').attr('src',e.target.result);
                $('#image_upload').css({
                    'width': '100px',
                    'height': '100px'
                })
             }
             
             reader.readAsDataURL(input.files[0]);
         }
        
    }
    
    $("#birthDate").datepicker({
        
        showOn:"button",
        numberOfMonths:2
    })
    
    $('#firstName').keypress(function (e){
        //console.log(e.charCode); 
        var regex  = new RegExp("^[A-Z a-z]*$");
        var str = String.fromCharCode(!e.charCode ? e.which :e.charCode)
        if(regex.test(str))
            return true;
        e.preventDefault();
        return false;
    });
    
    $('#contact').keypress(function (e){
        var reg = new RegExp("^[0-9]{0,10}$");
        var str  =String.fromCharCode(!e.charCode ? e.which :e.charCode);
        if(reg.test(str))
            return true;
        e.preventDefault();
           return false;
        
    });
    
    var count =0 ;
    $('#address').keypress(function (e){
        var reg = new RegExp("^[a-zA-Z0-9\-\/\,\\s\.]+$");
        if(e.charCode==8)
            count--;
        if(e.charCode!=8){
         var str  =String.fromCharCode(!e.charCode ? e.which :e.charCode);
        if(reg.test(str)){
            count++;
            if(count<5)
                $('#message').text("Minimum 5 required");
            if(count>=5 && count<=100)
                $('#message').text('');
            if(count>100){
                 $('#message').text('Exceeded the limit');
                return false;
            }
        
        return true;
        }}
        e.preventDefault();
        return false;
    });
    
     $("#state").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "http://gd.geobytes.com/AutoCompleteCity?callback=?&q="+request.term,
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                dataType: "jsonp",
                success: function (data) {
                    response(data);
                    $.each(data, function (item, value) {
                        console.log(value);
                    });
                },
                error:function(msg)
                {
                    console.log(msg);
                }
            });
        }
    });
    
    $("#regForm").submit(function(){
        console.log("submitted success");
        obj={
            FirstName:'',
            Email:'',
            Password:'',
            dob: new Date(), //to know what is the type of date
            Gender:'',
            Address:'',
            State:'',
            Contact:'',
            photo:'',
        }
        
        obj.FirstName=$('#firstName').val();
        obj.Email=$('#email').val();
        obj.Password=$('#password').val();
        obj.dob=$('#birthDate').val();
        obj.Gender=$(':radio:checked').val(); //wtever the value has been selected it has to be stored $('#for muliples:radio:checked').val()
        
        if(window.sessionStorage.getItem('photo')!=undefined)
            {
                obj.photo=window.sessionStorage.getItem('photo');
                
                /*for var data=[];
                checkbox $(":checkbox:checked").each(
                function(){
                    data.push($(this).val());
                })*/
            }
        obj.Address=$('#address').val();
        obj.State=$('#state').val();
        obj.Contact=$('#contact').val();
        
        console.log(obj);
        console.log(JSON.stringify(obj));
    
        
        return false; //so that the form should nto be refreshed
    })
})