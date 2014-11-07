[ ![Codeship Status for bozcotty/artcaring3.2](https://www.codeship.io/projects/28cb5180-46b3-0132-d0d9-567d034e6ff3/status)](https://www.codeship.io/projects/45390)

[![Coverage Status](https://coveralls.io/repos/bozcotty/artcaring3.2/badge.png?branch=readme)](https://coveralls.io/r/bozcotty/artcaring3.2?branch=readme)

## ArtCaring

ArtCaring was built in Rails 3.2 and is a personal project I undertook beginning in late fall 2013. As an artist, I wanted to build a site where artists and art collectors could gather and support individuals going through major health crises. This was inspired by my nephew's cancer diagnosis last summer, and wondering how I might help his family during this trial.

### Three Phases

- Phase 1 of the build started in November and went into January. This began as a capstone project for an online mentorship program I was involved in. Much of the code was in place, but the site was not ready to launch as some of the code wasn't operable.
- Phase 2 took place largely in April and May of 2014. While I had intentions of putting in evenings on the code base in February and March, I was, at the time, exhibiting art at a 10 week event in Scottsdale, AZ, which took nearly all of my time and energy. When I returned home to Montana from the exhibition, I began working nearly full-time on completing the code and launching the site. The site went live in late May.
- PHase 3 of the site took place after another hiatus during the summer where my work just kept me too busy to get much done here. At the end of October, 2014, while enrolled at CodeFellows in Seattle, I got ArtCaring.com approved as a work project for the final week of the course. Javier Soto (sotoseattle.com) joined me and we spent the week focused on writing tests, taking the test coverage from 0 to 75% and accomplishing a few other goals.

### What We Learned in Project Week...

We had plans to get a certain list of things done with our Project Week at Code Fellows. To put it nicely, we had to 'pivot' a bit as the reality of resistance in the code and existing undiscovered errors slowed us down.

Here's a narrative of lessons learned:
- While updating a Rails app from 3.2 to 4.x could be straightforward, issues like Gem versioning and the lack of any test coverage made this difficult. Had I originally written tests in the early phase of building the app, we would have avoided a major bug that we didn't discover until Tuesday, Day 2.
- We spent Day 1, Monday, trying different approaches to the upgrade to 4.2. We tried starting with just the gemfile on the existing 3.2 app (as recommended in a Railscast)...twice. We also tried starting over with a new 4.2 app with all of the new infrastructure in place, and porting over individual files and whole folders as appropriate. We also considered rebuilding our resources one by one with tests as we went, but decided not to carry out this approach. Inevitably we learned that there are many places to go wrong any approach and opportunities in the config and initialization files for something to be wired incorrectly are numerous by just trying to change the gemfile Rails version call.
- We realized how involved the Devise gem is and how interwoven it is in just about everything in an app where all the models and controllers are in some way tied to the signed in user.
- On Day 2, not having made the progress we wanted, we made a joint decision around noon that we needed to hold off on the 4.2 upgrade. We decided that getting some testing done, (Item 2 on our original list) was the most important thing to do. It was shortly thereafter that we discovered that some small changes and commits I had made during the summer were breaking the experience for new users. To make a long story short we learned how amazingly useful version control is. I was able to look back through the recent commits that I had made to the user dashboard view that was the root of the problem. We scrapped the little refactoring project I had started that was causing the problem and made the commit prior to it the new head on the master branch. From there, with the app 'working again', we started to make progress with the tests.
- We wrote tests the rest of the day and reaffirmed the usefulness of pair programming. Pairing on Day 2 and Day 3 during the test writing process helped immensely. Each of the initial CRUD tests on our resources were painful as there were numerous statements that some other part of the app did not like. The lesson learned with testing is that BDD integration tests go much slower when you're trying it retroactively.
- During Day 3, we were finally starting to complete some coverage on the app. Wiring up Codeship and Coveralls allowed us to see to our surprise that we had quite a bit more coverage than we thought. I was thinking we had maybe 25-30%, but Coveralls was telling us 75%.
- On Day 4, we did some more testing and a bunch of refactoring, taking out lots of unnecessary white space, correcting ugly formatting and indenting violations, and running Rubocop. We began tackling some security considerations and verified that we didn't have a dependency injection problem.
- Throughout the week we learned that while it's good to be optimistic about how far we would get on our user stories, it's even better not to try to rush through things, burn ourselves out, and feel bad about lack of progress and unreached goals. Besides not getting to the 4.2 upgrade, we didn't get to performance optimize like we wanted, nor did we extend Omniauth as originally planned. We didn't get to some of the Ajax-ifying and Angular-izing we were considering.
- We learned that an 8-week accelerator has the potential to reduce mental efficiency to (what seemed like) about half, at times, during Week 8.

### For the Developer(s):

- The app is passing its current tests.
- Stripe integration is functional.
- FAQ and other instructional material is straightforward and effort has been made to make the application easy to use.
- Some refactoring should be done to make the art categories attribute in the Artworks model its own resource. This will make adding to the list of possible art types in the future easier, by only needing to change the lengthy list in the categories model (or controller if updating to 4.2).
- There's still room to refactor individual lines and sections of code. The writing style within the code reflects what made the most sense to me as a novice programmer almost a year ago.
- Now that testing is in place, it makes sense to move this to 4.2.
- The biggest changes required, in moving to 4.2, involve consideration of strong parameters in the Artwork and Campaign models, and being mindful of not breaking the nested Artwork resource in the process.
- Omniauth was taken out because I found the User model had way too many attributes that I had tacked onto it outside of Devise. It would be nice to put it back in, but an Artist's Profile model of some sort should be built first, to handle the other attributes outside of the User model. Artists can then add the additional necessary information about themselves there, so that those attributes are not involved with initial sign up/sign in.


