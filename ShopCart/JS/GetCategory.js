$(document).ready(function () {
  
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "ViewProduct.aspx/GetCategory",
        data: "{}",
        dataType: "json",
        success: function (data) {
            
            $("#ddlCategory").empty();
            $("#ddlCategory").append("<option value='0'> Select Category </option>");
            console.log(data);
            var str = "";
            

            $.each(JSON.parse(data.d), function (key, value) {
               
                str = str + "<option value='" + value.CategoryID + "'> " + value.CategoryName + " </option>";
               
            });
            $("#ddlCategory").append(str);
           
        },
        error: function (data) {
            alert("Error");
        }
    });
});

