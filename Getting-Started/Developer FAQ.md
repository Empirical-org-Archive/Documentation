# Developer's FAQ

*This document outlines all of the questions we have recieved from developer. These answers have been incorporated into our documentation, and this doc serves as a reference point for those answers.* 

# Contributing 

#### Do we only do back end testing or front end too?
No frontend or acceptance testing framework is currently implemented so this is not necessary. 

#### Do we need to use feature branches or branches for issues? If so, is there a naming convention for this?

1 pull request per issue, no need to name the branch anything in particular (no one else will use your branch so it doesn’t matter). 

#### Should I replace the URL with my forked repo in the submodules in my development environment? How do you recommend I setup my development environment best to work with the project?

you could do this:
git rename origin upstream
git remote add origin git@your-fork


# API Design

#### How do lessons fit in with Empirical Core? How do the two applications communicate?

[See this doc](https://github.com/empirical-org/Documentation/blob/master/empirical-core/API-Design/API%20Docs.md)
- lesson data is stored in Empirical Core and is parsed by quill
- quill queries api through that data
- lesson passes id used to look up that information

# Outstanding Questions

*Questions that need to be answered.*

How is the data stored in the honey cms? same DB


