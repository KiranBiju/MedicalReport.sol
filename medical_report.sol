// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalReport {
    struct Report {
        string symptoms;
        string assumptions;
        string prescription;
    }

    mapping(string => Report[]) private reports;

    function addReport(string memory id, string memory symptoms, string memory assumptions, string memory prescription) public {
        require(bytes(id).length > 0, "Invalid patient ID");
        require(bytes(symptoms).length > 0, "Symptoms cannot be empty");
        require(bytes(assumptions).length > 0, "Assumptions cannot be empty");
        require(bytes(prescription).length > 0, "Prescription cannot be empty");
        Report memory newReport = Report(symptoms, assumptions, prescription);
        reports[id].push(newReport);
    }

    function getReports(string memory id) public view returns (string[] memory symptoms, string[] memory assumptions, string[] memory prescription) {
        require(bytes(id).length > 0, "Invalid patient ID");
        uint256 reportCount = reports[id].length;
        symptoms = new string[](reportCount);
        assumptions = new string[](reportCount);
        prescription = new string[](reportCount);
        for (uint256 i = 0; i < reportCount; i++) {
            Report storage report = reports[id][i];
            symptoms[i] = report.symptoms;
            assumptions[i] = report.assumptions;
            prescription[i] = report.prescription;
        }
    }
}
