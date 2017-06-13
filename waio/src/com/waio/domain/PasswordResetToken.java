package com.waio.domain;

import java.util.Date;

import com.waio.dto.ProfileDTO;

public class PasswordResetToken {
 
    private static final int EXPIRATION = 60 * 24;

    //@GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
 
    private String token;
 
   // @OneToOne(targetEntity = User.class, fetch = FetchType.EAGER)
  //  @JoinColumn(nullable = false, name = "user_id")
    private ProfileDTO profile;
 
    private Date expiryDate;
}