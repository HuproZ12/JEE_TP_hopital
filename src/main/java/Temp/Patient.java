package Temp;

import lombok.*;
import javax.persistence.*;

@Builder @Data @NoArgsConstructor @AllArgsConstructor
@Entity @Table(name = "patient")

public class Patient {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) @Column(name = "id_patient") private int id;
    private String nom;
    private String prenom;
    private String naissance;
}