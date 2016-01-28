TODOS:

1. Decide on application architecture [x]
 - interface [x] `imgflip-cucumber cucumber`
 - gems / libraries [x]
 - patterns etc... [x]
 - Create flexible browser obj [x]
 - Integrate cucumber with browser [x]
  - Add example cucumber test [x]
- Add logging to framework [x]
- Create command to run tests from command-line [ ]
- Check dependencies & bundle package for release [x]
- Test that package runs on a clean VM [ ]
- Extract config into config hash [ ]
- Add screenshots & outputs [ ]

2. Investigate the application under test [ ]
 - spend 1hr investigating the application under test [x]
 - Write a mind map for the testing plan [x]
 - Split out functional and nonfunctional tests [ ]
 - Write the functional tests [x]
 - Write the nonfunctional tests [ ]
 - Missing from tests
  - no time to test the authenticated flows
  - no time to test the optons on text (that would have been interesting on some of those strings :)
  - no time to test for combinations (doing this sort of testing w/ cucumber is tricky & I have lots of tests running already)
  - ran out of time to select a different image

 Notes as I go
 - I spent approximately 5 hours total on this exercise.  As a result, it could probably do with a bit of refactoring.  I've tried to balance creating a robust, maintainable architecture with actually being able to write some tests.  I've also focussed on the requirements document itself for formulating the test plan, hence I've written tests to cover the parts of functionality mentioned, and left everything else (a depth first approach I guess).  I've tagged any tests that are failing (due to supposed defects) with the @failing annotation.

 - I didn't complete some tasks around packaging and releasing.  But I ran out of time.  Given more time, I would have added a command to run all the tests from the command line, although it would have only been a thin wrapper around the raketask.

 - I've tried to keep some encapsulation between the 'framework' and the 'tests' by splitting them into separate folders. If I was able to refactor, I would most likely extract a library from the framework and require it in the various projects that needed tests.  I would probably also abstract browser creation from the tests too so that I could add cross browser support at a later date.

 - The requirement to validate html is a bit of a tricky one.  Without a customer to talk to, it's difficult to know what you mean by 'valid html'.  I've added a simply validator using nokogiri, but it's a very blunt instrument.  Moving forward - a better way to approach this would be through the w3c validation apis - however I see this as more of a info level thing, that a test - i.e. It's useful information - but actually failing a test for it seems a bit much. If you check here https://validator.w3.org/nu/?doc=https%3A%2F%2Fimgflip.com%2Fmemegenerator you will see that the page has a lot of errors on already.

 - As specified, I've used cucumber for all the tests here, but you'll probably notice that a lot of this could be written more concisely without cucumber.  I agree cucumber is great for converging engineers and product owners on requirements - but for many of the edge cases I've added, I feel like the detail is unnecessary.  Given free rein I would probably have written many of these in RSpec and parallelized with the parallel gem them to speed up the feedback loop.
