//
//  Router.swift
//  kinopub
//
//  Created by Andrzej Wielski on 04.01.2023.
//

import SwiftUI
import SwiftUIRouter

struct RouterView: View {
    var body: some View {
        // ScrollView adds bugs during height calculating
        // But without ScrollView there is no nasty blur effect on toolbar
        // TODO: make it work somehow
//        ScrollView(.vertical) {
            SwitchRoutes {
                Route("Item/:id", validator: getItemId) { itemId in
                    if let itemId = itemId {
                        ItemDetailsScreen(id: itemId)
                    }
                }

                Route("Player/:id/:startFrom", validator: getPlayerProps) { (mediaId, startFrom) in
                    if let mediaId = mediaId {
                        PlayerScreen(mediaId: mediaId, startFrom: startFrom)
                    }
                }
                .swipeableBack(action: .back)

                Route(":unknown") {
                    ErrorScreen()
                }
                Route("/") {
                    WhatToWatchScreen()
                }
            }
//        }
    }

    private func getItemId(route: RouteInformation) -> Int? {
        if let parameter = route.parameters["id"],
           let id = Int(parameter)
        {
            return id
        }
        return nil
    }

    private func getPlayerProps(route: RouteInformation) -> (Int?, Int?) {
        print(route)
        if let parameter = route.parameters["id"],
           let id = Int(parameter)
        {
            if let parameter = route.parameters["startFrom"],
               let startFrom = Int(parameter)
            {
               return (id, startFrom)
            }
            return (id, nil)
        }
        return (nil, nil)
    }
}
