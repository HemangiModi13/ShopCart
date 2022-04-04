$(document).ready(function () {
    var filename;
    //var fp;
    //function ShowPreview(input) {
    //    alert(1);
    //    if (input.files && input.files[0]) {
    //        alert(2);
    //        filename = Path.GetFileName(ipfile.FileName);
    //        var path = "/UploadedFiles/" + filename;
    //        ipfile.SaveAs(Server.MapPath(path));

    //        var ImageDir = new FileReader();
    //        ImageDir.onload = function (e) {
    //            $('#impPrev').attr('src', e.target.result);
    //        }
    //        ImageDir.readAsDataURL(input.files[0]);
    //    }
    //}
   
    $("#Image").change(function () {
       
        if (this.files && this.files[0]) {
            filename = this.files[0].name;
            
            //fp = this.files[0];
            //var path = "/UploadedFiles/" + filename;
            //fp.SaveAs(HttpContext.Current.Server.MapPath(path));

            var ImageDir = new FileReader();
            ImageDir.onload = function (e) {
                $('#impPrev').attr('src', e.target.result);
            }
            ImageDir.readAsDataURL(this.files[0]);
        }
    });

    
    $('#submit').on('click', function () {

        if (validateUser() == false) {

            $("span").show();

            return false;
        }
        else {
            var prod = {};

            prod.ProductName = $('#ProductName').val();
            prod.CategoryID = $('#ddlCategory').val();
            prod.Image = filename;
            prod.Price = $('#Price').val();
            //prod.FileInput = fp;

            //var jsondata = JSON.stringify({
            //    Details : prod
            //});
           
                $.ajax({
                    type: "POST",
                    url: "ViewProduct.aspx/SaveProduct",
                    //data: jsondata,
                    data: '{Prods: ' + JSON.stringify(prod) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        debugger;
                        if (response.d == "success") {
                            $("#msg").html("New Product Inserted Successfully...").css("color", "green");
                        }
                        
                    },
                    error: function (response) {
                        $("#msg").html("Not Inserted...").css("color", "red");
                    }
                });
        }
    });

   
});

function validateUser() {
    if ($("#ProductName").val() == "") {
        $("#Error_ProductName").show();
        return false;
    }

    else if ($("#Price").val() == "") {
        $("#Error_Price").show();
        return false;
    }
    
    
    else {
        return true;
    }
}



