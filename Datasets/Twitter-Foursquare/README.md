INTRODUCTION
============

The original dataset is collected by Zhang et al. [1]. If you want the original datasetm, please contact him. We only share a part of the original dataset used in our paper, i.e., their mobility trajectories. In addition, the user IDs have also been hashed.

On Foursquare, users may display their Twitter account information, which makes it possible to obtain the ground-truth mapping between Twitter IDs and
Foursquare IDs. 
In order to investigate our problem (linking ID based on location data), we extract all trajectories with cross linking from the original dataset.

Specifically, there are two files:

[fs_data.txt](https://github.com/anonymityICDM17/tmpICDM17/Datasets/Twitter-Foursquare/fs_data.txt) - Users' trajectories on Foursquare.

[tt_data.txt](https://github.com/anonymityICDM17/tmpICDM17/Datasets/Twitter-Foursquare/tt_data.txt) - Users' trajectories on Twitter.

They have similar format including fields as follow (using underline as the delimiter):
User ID Timestamp latitude longitude

REFERENCES
==========

Please cite the references appropriately in case they are used.

1.  J. Zhang, X. Kong, and P. S. Yu, "Transferring heterogeneous links across location-based social networks," in Proc. WSDM, 2014.