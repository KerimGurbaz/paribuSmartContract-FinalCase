// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RentalContract {
    struct Property {
        address owner;
        string propertyType; // "house" veya "shop"
        string addressInfo;
        bool isRented;
    }

    struct RentalAgreement {
        address tenant;
        uint256 startDate;
        uint256 endDate;
    }

    mapping(uint256 => Property) public properties;
    mapping(uint256 => RentalAgreement) public rentalAgreements;

    uint256 public propertyCount;

    // Yeni mülk ekleme
    function addProperty(string memory propertyType, string memory addressInfo) public {
        properties[propertyCount] = Property(msg.sender, propertyType, addressInfo, false);
        propertyCount++;
    }

    // Kiralama işlemi
    function rentProperty(uint256 propertyId, address tenant, uint256 startDate, uint256 endDate) public {
        require(properties[propertyId].owner == msg.sender, "Only the owner can rent this property");
        require(!properties[propertyId].isRented, "Property is already rented");
        rentalAgreements[propertyId] = RentalAgreement(tenant, startDate, endDate);
        properties[propertyId].isRented = true;
    }

    // Kiralama işlemini sonlandırma
    function terminateRental(uint256 propertyId) public {
        require(properties[propertyId].owner == msg.sender, "Only the owner can terminate the rental");
        properties[propertyId].isRented = false;
    }

    // Kiracı tarafından hata raporlama
    function reportIssue(uint256 propertyId, string memory issueDescription) public {
        require(rentalAgreements[propertyId].tenant == msg.sender, "Only the tenant can report an issue");
        // Hata raporlama işlemleri burada gerçekleştirilebilir.
    }
}
