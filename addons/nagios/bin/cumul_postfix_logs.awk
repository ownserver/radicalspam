#!/usr/bin/awk -f

BEGIN {
   CONVFMT="%d"
   FS="="

   REJECT_5XX=0
   REJECT_4XX=0
   REJECT_WARNING=0
   REJECT_CLIENT=0
   REJECT_SENDER=0
   REJECT_RECIPIENT=0
   ERROR=0
   WARNING=0
   SMTP_MAIL_SENT=0
   SMTP_MAIL_DEFERRED=0
   SMTP_MAIL_BOUNCED=0
   SMTP_DELAY_EXT=0
   SMTP_DELAY_LOCAL=0
   MAIL_SIZE=0
   POSTGREY_DELAY=0
}


NF == 0 { next }

( NF != 0 ){
   if ( $1 ~ /^REJECT_5XX/ ) {
      REJECT_5XX=REJECT_5XX+$2
   }
   if ( $1 ~ /^REJECT_4XX/ ) {
      REJECT_4XX=REJECT_4XX+$2
   }
   if ( $1 ~ /^REJECT_WARNING/ ) {
      REJECT_WARNING=REJECT_WARNING+$2
   }
   if ( $1 ~ /^REJECT_CLIENT/ ) {
      REJECT_CLIENT=REJECT_CLIENT+$2
   }
   if ( $1 ~ /^REJECT_SENDER/ ) {
      REJECT_SENDER=REJECT_SENDER+$2
   }
   if ( $1 ~ /^REJECT_RECIPIENT/ ) {
      REJECT_RECIPIENT=REJECT_RECIPIENT+$2
   }
   if ( $1 ~ /^ERROR/ ) {
      ERROR=ERROR+$2
   }
   if ( $1 ~ /^WARNING/ ) {
      WARNING=WARNING+$2
   }
   if ( $1 ~ /^SMTP_MAIL_SENT/ ) {
      SMTP_MAIL_SENT=SMTP_MAIL_SENT+$2
   }
   if ( $1 ~ /^SMTP_MAIL_DEFERRED/ ) {
      SMTP_MAIL_DEFERRED=SMTP_MAIL_DEFERRED+$2
   }
   if ( $1 ~ /^SMTP_MAIL_BOUNCED/ ) {
      SMTP_MAIL_BOUNCED=SMTP_MAIL_BOUNCED+$2
   }
   if ( $1 ~ /^SMTP_DELAY_EXT/ ) {
      SMTP_DELAY_EXT=SMTP_DELAY_EXT+$2
   }
   if ( $1 ~ /^SMTP_DELAY_LOCAL/ ) {
      SMTP_DELAY_LOCAL=SMTP_DELAY_LOCAL+$2
   }
   if ( $1 ~ /^MAIL_SIZE/ ) {
      MAIL_SIZE=MAIL_SIZE+$2
   }
   if ( $1 ~ /^POSTGREY_DELAY/ ) {
      POSTGREY_DELAY=POSTGREY_DELAY+$2
   }
}


END {
   print "UPTIME="UPTIME
   print "REJECT_5XX="REJECT_5XX
   print "REJECT_4XX="REJECT_4XX
   print "REJECT_WARNING="REJECT_WARNING
   print "REJECT_CLIENT="REJECT_CLIENT
   print "REJECT_SENDER="REJECT_SENDER
   print "REJECT_RECIPIENT="REJECT_RECIPIENT
   print "ERROR="ERROR
   print "WARNING="WARNING
   print "SMTP_MAIL_SENT="SMTP_MAIL_SENT
   print "SMTP_MAIL_DEFERRED="SMTP_MAIL_DEFERRED
   print "SMTP_MAIL_BOUNCED="SMTP_MAIL_BOUNCED
   print "SMTP_DELAY_EXT="SMTP_DELAY_EXT
   print "SMTP_DELAY_LOCAL="SMTP_DELAY_LOCAL
   print "MAIL_SIZE="MAIL_SIZE
   print "POSTGREY_DELAY="POSTGREY_DELAY
}
