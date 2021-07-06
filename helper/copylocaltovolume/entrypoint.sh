#!/bin/sh

if [ "$SHOW_LOCAL_LIST_BEFORE" = true ]
then
  echo "Show local list before"
  ls -al /local/
fi

if [ "$SHOW_VOLUME_LIST_BEFORE" = true ]
then
  echo "Show volume list before"
  ls -al /volume/
fi

if [ "$CLEAR_BEFORE" = true ] && [ "$DRY_RUN" = false ]
then
  echo "Clear volume before"
  rm -rf /volume/*
fi

if [ "$DRY_RUN" = false ]
then
    echo "start copy..."
    cp -R /local/* /volume/
    echo "...finished"
else 
  echo "dry run is switched on and therefore no copying happens here"
fi

if [ -n "$USER_ID" ] && [ -z "$GROUP_ID" ]
then
  echo "Use $USER_ID for chown"
  chown -R $USER_ID /volume
fi

if [ -n "$USER_ID" ] && [ -n "$GROUP_ID" ]
then
  echo "Use $USER_ID:$GROUP_ID for chown"
  chown -R $USER_ID:$GROUP_ID /volume
fi

if [ -n "$CHMOD" ]
then
  echo "Use $CHMOD for folder"
  chmod -R $CHMOD /volume
fi

if [ "$SHOW_VOLUME_LIST_AFTER" = true ]
then
  echo "Show volume list after copied"
  ls -al /volume/
fi

