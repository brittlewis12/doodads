doodads
=======

## What is it?

Doodads are app features. iOS only, for now.

Search for and follow apps, submit doodad ideas, and more to come.

## Why did you make it?
### GA WDI NYC: Project 1 

This project is the culmination of the first four weeks of General Assembly's Web Development Immersive course, after one week's exposure to Rails. We spent one week reviewing and fleshing out our understanding of Ruby; two weeks building simple scripts and sinatra web apps; and a one week introduction to Rails.

We had one week to research, devise, and implement our ideas to the best of our abilities. It was an exciting, challenging, and exhausting experience, but I learned more and more each day that I spent. It was really incredibly rewarding to watch the app grow from an abstract, off-the-cuff idea to a live, working application.

I learned a lot about the importance of having a structured approach to tackling the challenges that crop up along the way to building an application, in both a micro and a macro sense; crafting thoughtful, well-challenged user stories really aids in that process on both levels. It's far too easy to get distracted by implementation options, or styling quibbles, or any number of other distractions that present themselves as you work through each user story, but always keeping the goal in mind from the user's perspective helps maintain focus.

## What's next?

I plan to continue to invest in building this projet out and expanding upon the foundational feature I've added, integrating new concepts/languages/frameworks as I learn them. Some things I'd like to add: 

  * upvoting doodads (relying upon the acts_as_votable gem)
  * a background rake task that updates my server's apps table by periodically polling the iTunes Search API for each "artistId" (or, as I named it, "itunes_id"), comparing the response value for the current "version" against the locally stored value, and updating the table with all changed data
  * notifications (text, email) when an app is updated

Another, more challenging capability I'd like to add in the future is updates when/if doodads are implemented. I still have a lot of thinking to do about how that would look, but I have some ideas.

## Wrapping up

Feel free to comment, sumbit issues, and fork/pull request any changes you'd like to see. I welcome feedback with regards to any aspect of the application -- this was, above all, was a learning experience after all. I'd like to thank my instructors @jkonowitch, @h4w5, @peterylai for facilitating my journey so far and making it an incredibly fun and rewarding experience already; I'd like to thank my parents for making this possible.