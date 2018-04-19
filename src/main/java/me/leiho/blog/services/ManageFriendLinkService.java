package me.leiho.blog.services;

import me.leiho.blog.entities.XFriendLink;

import java.util.List;

public interface ManageFriendLinkService {
    String updateLinks(List<XFriendLink> links);
}
