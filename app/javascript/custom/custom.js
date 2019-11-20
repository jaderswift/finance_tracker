//= require jquery
//= require_tree .

$(document).on('turbolinks:load', function() {
    $('#stock-lookup-form').on('ajax:complete', function(event, data, status){                      
        $('#results').html(data)     
    })
    $('#friend-lookup-form').on('ajax:complete', function(event, data, status){                      
        $('#results').html(data)     
    })
})