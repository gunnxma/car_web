function get_options(value){
    $("#car_info_series").empty();
    $("#car_info_series").append("<option value=''>选择车系</option>");
    $.ajax({  
      type: "GET",  
      url:'/series/ajax_search.json?brand='+value,
      data:'text',  
      success: function(data){
        for(var i = 0; i < data.length; i++) {
            $("#car_info_series").append("<option value='"+data[i].name+"'>"+data[i].initial+' '+data[i].name+"</option>");
        }
      }  
    }  
  );  
}

function set_cooperation(value) {
  if (value == "合作商户") {
    $("#div_cooperation").css("display","");
  } else {
    $("#div_cooperation").css("display","none");
  }
}