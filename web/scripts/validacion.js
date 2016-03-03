/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $("#submitGestion").prop("disabled", true);
    $("input:checkbox").change(function(){
        if($(this).is(":checked")) {
            $("#submitGestion").prop("disabled", false);
        } 
        else {
            if($("input:checked").length === 0) {
                $("#submitGestion").prop("disabled", true);
            }
        }
    });
});

