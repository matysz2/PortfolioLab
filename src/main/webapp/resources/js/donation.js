$(document).ready(function() {
    // Funkcja do aktualizowania sekcji podsumowania danymi z darowizny
    function updateSummary(donation) {
        $('#summaryQuantity').text(donation.quantity + ' worki ubrań w dobrym stanie dla dzieci');
        $('#summaryInstitution').text('Dla fundacji "' + donation.institution.name + '" w ' + donation.city);
        $('#street').text(donation.street);
        $('#city').text(donation.city);
        $('#zipCode').text(donation.zipCode);
        $('#phone').text(donation.phone);
        $('#pickUpDate').text(donation.pickUpDate);
        $('#pickUpTime').text(donation.pickUpTime);
        $('#pickUpComment').text(donation.pickUpComment);
    }

    // Wysłanie żądania AJAX do serwera, aby pobrać dane darowizny
    $.get('/donation/data', function(donation) {
        updateSummary(donation); // Aktualizuj podsumowanie otrzymanymi danymi
    });
});