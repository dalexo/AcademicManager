# AcademicManager

**Requirements**
================
To Java project χρειάζεται υποχρεωτικά JRE 1.8 και Eclipse Neon για development.

Έχω προσθέσει μόνο τα σχετικά αρχεία για την Ηomepage σελίδα, όπως π.χ Homepage.jsp, Homepage.css. Η σελίδα δεν είναι responsive και τρέχει καλύτερα στον Firefox το background Χρώμα του μενού button που πρέπει να είναι γκρίζο σε σχέση με τον chrome που βγαίνει πράσινο - Στέφανος 

Database Installation (MariaDB 10.1)

Για την εγκατάσταση της βάσης δεδομένων θα χρειαστεί πρώτα εγκατάσταση του XAMPP (οποιαδήποτε από τις τελευταίες εκδόσεις αρκούν).
Στην συνέχεια εφόσον κάνουμε start τα services Apache και MySQL από το XAMPP Control Panel θα πάμε από τον browser μας στο localhost/phpmyadmin και αφού δημιουργήσουμε την βάση academic_manager θα κάνουμε import το academicmanager.sql χρησιμοποιώντας τις default ρυθμίσεις. Περισσότερες πληροφορίες στις σελίδες Database Technical Information και Database Installation του Wiki.

Java Naming and Directory Interface (JNDI) Implementation

Στο project έχει γίνει υλοποίηση του JNDI όπου θα πρέπει να προστεθούν οι απαραίτητες ρυθμίσεις στο web.xml του project καθώς και στο context.xml του Tomcat. Αναλυτική περιγραφή των ρυθμίσεων που χρειάζονται θα βρείτε στην σελίδα Java Naming and Directory Interface του Wiki.

JSP Pages CSS

Στις JSP σελίδες γίνεται χρήση CSS και Bootstrap για responsive design. Συγκεκριμένα χρησιμοποιήθηκε το Bootstrap CDN 3.3.7.
