[ ![Codeship Status for bozcotty/artcaring3.2](https://www.codeship.io/projects/28cb5180-46b3-0132-d0d9-567d034e6ff3/status)](https://www.codeship.io/projects/45390)

[![Coverage Status](https://coveralls.io/repos/bozcotty/artcaring3.2/badge.png?branch=readme)](https://coveralls.io/r/bozcotty/artcaring3.2?branch=readme)

[![Code Climate](https://codeclimate.com/github/bozcotty/artcaring3.2/badges/gpa.svg)](https://codeclimate.com/github/bozcotty/artcaring3.2)

## ArtCaring

ArtCaring was built in Rails 3.2 and is a personal project I undertook beginning in late fall 2013. As an artist, I wanted to build a site where artists and art collectors could gather and support individuals going through major health crises. This was inspired by my nephew's cancer diagnosis last summer, and wondering how I might help his family during this trial.


### Three Phases

- Phase 1 of the build started in November and went into January. This began as a capstone project for an online mentorship program I was involved in. Much of the code was in place, but the site was not ready to launch as some of the code wasn't operable. My mentor, Adam Louis helped with the code base and pointed me in the right direction on many occasions.
- Phase 2 took place largely in April and May of 2014. While I had intentions of putting in evenings on the code base in February and March, I was, at the time, exhibiting art at a 10 week event in Scottsdale, AZ, which took nearly all of my time and energy. When I returned home to Montana from the exhibition, I began working nearly full-time on completing the code and launching the site. The site went live in late May.
- Phase 3 of the site took place after another hiatus during the summer where my work just kept me too busy to get much done here. At the end of October, 2014, while enrolled at CodeFellows in Seattle, I got ArtCaring.com approved as a work project for the final week of the course. Javier Soto (sotoseattle.com) joined me and we spent the week focused on writing tests, taking the test coverage from 0 to 75% and accomplishing a few other goals.


### For the Developer(s), Next Steps:

- The app is passing its current tests.
- Stripe integration is functional.
- FAQ and other instructional material is straightforward and effort has been made to make the application easy to use.
- Some refactoring should be done to make the art categories attribute in the Artworks model its own resource. This will make adding to the list of possible art types in the future easier, by only needing to change the lengthy list in the categories model (or controller if updating to 4.2).
- There's still room to refactor individual lines and sections of code. The writing style within the code reflects what made the most sense to me as a novice programmer almost a year ago.
- Now that testing is in place, it makes sense to move this to 4.2.
- The biggest changes required, in moving to 4.2, involve consideration of strong parameters in the Artwork and Campaign models, and being mindful of not breaking the nested Artwork resource in the process.
- Omniauth was taken out because I found the User model had way too many attributes that I had tacked onto it outside of Devise. It would be nice to put it back in, but an Artist's Profile model of some sort should be built first, to handle the other attributes outside of the User model. Artists can then add the additional necessary information about themselves there, so that those attributes are not involved with initial sign up/sign in.
- Destroy campaigns remains to be built. There is a caveat that an artist cannot destroy a campaign/or their account if there are outstanding art transactions with buyers (ie art hasn't been shipped to the buyer, etc).
