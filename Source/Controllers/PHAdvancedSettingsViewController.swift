//
//  PHUpdateSettingsViewController.swift
//  Product Hunt
//
//  Created by Vlado on 4/18/16.
//  Copyright © 2016 ProductHunt. All rights reserved.
//

import Cocoa
import Sparkle
import DateTools

class PHAdvancedSettingsViewController: NSViewController, PHPreferencesWindowControllerProtocol {

    @IBOutlet weak var automaticallyCheckForUpdatesButton: NSButton!
    @IBOutlet weak var automaticallyDownloadUpdatesButton: NSButton!

    private let formatter = PHDateFormatter()
    private var updater: SUUpdater {
        return SUUpdater.sharedUpdater()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyCheckForUpdatesButton.setState(forBool: updater.automaticallyChecksForUpdates)
        automaticallyDownloadUpdatesButton.setState(forBool: updater.automaticallyDownloadsUpdates)
    }

    // MARK: Actions

    @IBAction func automaticallyCheckForUpdatesAction(sender: NSButton) {
        updater.automaticallyChecksForUpdates = sender.boolState
    }

    @IBAction func automaticallyDownloadUpdatesAction(sender: NSButton) {
        updater.automaticallyDownloadsUpdates = sender.boolState
    }

    // MARK: PHPreferencesWindowControllerProtocol

    func preferencesIdentifier() -> String {
        return "PHAdvancedSettingsViewController"
    }

    func preferencesTitle() -> String {
        return "Advanced"
    }

    func preferencesIcon() -> NSImage {
        return NSImage(named: NSImageNameAdvanced)!
    }
}
