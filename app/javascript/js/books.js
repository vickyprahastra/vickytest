import $ from 'jquery'
import 'select2'
import 'select2/dist/css/select2.css'

window.addEventListener('DOMContentLoaded', () => {
    $('#filter_by_authors, #filter_by_years, #filter_by_min_pages, #filter_by_max_pages, #filter_by_books').on('select2:select', function (e) {
        console.log(e.currentTarget.id)
        console.log(e.params.data)
        console.log(e)
    });

    $("#filter_by_authors").select2({
        placeholder: "Author",
        multiple: true,
        tokenSeparators: [',', ' '],
        minimumInputLength: 2,
        minimumResultsForSearch: 5,
        ajax: {
            url: '/api/authors/search',
            dataType: "json",
            type: "GET",
            data: function (params) {

                var queryParameters = {
                    name: params.term
                }
                return queryParameters;
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.name,
                            id: item.int_id
                        }
                    })
                };
            }
        }
    })

    $("#filter_by_years").select2({
        placeholder: "Year",
        multiple: true,
        tokenSeparators: [',', ' '],
        minimumInputLength: 2,
        minimumResultsForSearch: 5,
        ajax: {
            url: '/api/books/search',
            dataType: "json",
            type: "GET",
            data: function (params) {

                var queryParameters = {
                    year: params.term
                }
                return queryParameters;
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.year,
                            id: item.int_id
                        }
                    })
                };
            }
        }
    })

    $("#filter_by_min_pages").select2({
        tokenSeparators: [',', ' '],
        placeholder: "Min",
        minimumResultsForSearch: 5,
        allowClear: true
    })

    $("#filter_by_max_pages").select2({
        tokenSeparators: [',', ' '],
        placeholder: "Max",
        minimumResultsForSearch: 5,
        allowClear: true
    })

    $("#filter_by_books").select2({
        placeholder: "Book",
        multiple: true,
        tokenSeparators: [',', ' '],
        minimumInputLength: 2,
        minimumResultsForSearch: 5,
        ajax: {
            url: '/api/books/search',
            dataType: "json",
            type: "GET",
            data: function (params) {

                var queryParameters = {
                    title: params.term
                }
                return queryParameters;
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.title,
                            id: item.int_id
                        }
                    })
                };
            }
        }
    })

})
