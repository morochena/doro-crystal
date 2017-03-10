# doro-crystal

## Description

A minimalist CLI pomodoro application. Logs to ~/.doro in CSV format. Ported from http://github.com/morochena/doro

## Install

`$ brew tap morochena/tap`
`$ brew install doro`

For OSX notifications: 

`$ brew install terminal-notifier` 

## Usage

  `$ doro start [-t tag] description of task`

This starts a 25 minute pomodoro timer in your terminal. To exit the pomodoro early, you can sent an interrupt with Ctrl+C. Whether you let it finish or not, it will save an entry of your pomodoro to `~/.doro` and notify you.

  `$ doro list`

This displays a list of your previous pomodoro entries.

  `$ doro break`

This starts a 5 minute break timer to be used in between pomodoros.

  `$ doro help`

For detailed information.