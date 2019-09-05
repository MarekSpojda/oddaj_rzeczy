package pl.coderslab.charity.utilities;

import pl.coderslab.charity.repository.InstitutionRepository;

import java.time.LocalDate;
import java.time.LocalTime;

public class Utilities {
    private static InstitutionRepository institutionRepository;

    public Utilities(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    public static LocalDate stringToLocalDate(String dateInString) {
        return LocalDate.parse(dateInString);
    }

    public static LocalTime stringToLocalTime(String timeInString) {
        return LocalTime.parse(timeInString);
    }

    public static String getInstitutionName(String stringID) {
        return institutionRepository.findByIdCustom(Long.parseLong(stringID)).getName();
    }
}
