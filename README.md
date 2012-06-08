# Stack Overflow Comment-Hellban Calculator

## Copyright and Licensing

### Copyright Notice

The copyright for the software, documentation, and associated files are
held by the author.

    Copyright 2012 Todd A. Jacobs
    All rights reserved.

The AUTHORS file is also included in the source tree.

### Software License

![GPLv3 Logo](http://www.gnu.org/graphics/gplv3-88x31.png)

The software is licensed under the
[GPLv3](http://www.gnu.org/copyleft/gpl.html). The LICENSE is also
included in the source tree.

### README License

![Creative Commons BY-NC-SA
Logo](http://i.creativecommons.org/l/by-nc-sa/3.0/us/88x31.png)

This README is licensed under the [Creative Commons
Attribution-NonCommercial-ShareAlike 3.0 United States
License](http://creativecommons.org/licenses/by-nc-sa/3.0/us/).

## Purpose

This is a calculator for determining how close a user is to being
comment-hellbanned on Stack Overflow. You can find your flag counts at
http://stackoverflow.com/users/flag-summary/<stackoverflow_userid>.

## Caveats

- The flag weight calculation is subject to change, so don't bet the
  farm on it.

- The flag counts are only visible to logged in users, and (generally)
  only your own flag counts. Without authentication, this calculator
  can't scrape the values for you; you have to enter them on the command
  line. Patches welcome.

## Supported Ruby Versions

- The software was tested against Ruby 1.9.3-p194.
- Ruby 1.8.x is unsupported.

## Usage

    ruby so-comment-hellban.rb <declined_flags> <helpful_flags>

## Examples

These are examples of what you might see when running the tool from the
command line. Runtime results may vary.

With 10 "declined" flags and 90 "helpful" flags:

    $ ruby so-comment-hellban.rb 10 90
    # Stack Overflow Comment-Hellban Calculator

      - Current Flag Weight: 90
      - Hellban Status: You aren't banned...yet.

With 11 "declined" flags and 1 "helpful" flag:

    $ ruby so-comment-hellban.rb 11 1
    # Stack Overflow Comment-Hellban Calculator

      - Current Flag Weight: 0
      - Hellban Status: You are hellbanned.

    See http://meta.stackoverflow.com/questions/82445/comment-hellban
    for more information.

----
[Project Home Page](https://github.com/CodeGnome/so-comment-hellban)
