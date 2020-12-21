package org.example.twitter.domain.util;

import org.example.twitter.domain.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }

}
