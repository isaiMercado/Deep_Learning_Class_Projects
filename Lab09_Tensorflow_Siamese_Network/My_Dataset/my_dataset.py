
import numpy as np
import scipy.misc
from sklearn.utils import shuffle

#import matplotlib.pyplot as plt
#import matplotlib



class Dataset(object):
    def __init__(self, features, labels):
        self.features = features
        self.labels = labels
        self.index = 0
     
        
    def get_next_random_batch(self, batch_size):
        self.features, self.labels = shuffle(self.features, self.labels)
        return self.features[0:batch_size,:], self.labels[0:batch_size,:]
          
          
    def get_next_batch(self, batch_number):
        if (self.index == len(self.features)):
            self.index = 0
    
        x, y = [], []
        for i in range(batch_number):
            x.append(self.features[self.index])
            y.append(self.labels[self.index])
            self.index = self.index + 1
            
        return np.array(x), np.array(y)
        
        
    def get_next_siamese_batch(self, batch_size):
        next_x, next_y = None, None
        good_x, good_y = [], []
        keep_looping = True
        while(keep_looping) :
            good_x, good_y = [], []
            next_x, next_y = self.get_next_batch(1)
            for i in range(10):
                x, y = self.get_next_batch(1)
                if y == next_y:
                    good_x.append(x)
                    good_y.append(y)
                if len(good_x) == batch_size/2:
                    keep_looping = False
                    break
            
        next_x, next_y = next_x.reshape((1, 62500)), next_y.reshape((1,1)) 
        x1, y1 = np.tile(next_x, (batch_size, 1)), np.tile(next_y, (batch_size, 1))
                    
        bad_x, bad_y = [], []
        
        while(len(bad_x) < batch_size/2):
            x,y = self.get_next_batch(1)
            if y != next_y:
                bad_x.append(x)
                bad_y.append(y)

        #print("next_x " + str(next_x.shape))
        #print("next_y " + str(next_y.shape))
        
        #print("good_x " + str(good_x[0].shape))
        #print("good_y " + str(good_y[0].shape))
        
        #print("bad_x " + str(bad_x[0].shape))
        #print("bad_y " + str(bad_y[0].shape))              
        
        x2, y2 = np.concatenate((good_x, bad_x)), np.concatenate((good_y, bad_y))
       
        x1 = x1.reshape(-1,250,250,1)
        x2 = x2.reshape(-1,250,250,1)
        y = (y1 == y2).astype(float) 
        
        #print("x1 " + str(x1.shape))
        #print("y1 " + str(y1.shape))
        
        #print("x2 " + str(x2.shape))
        #print("y2 " + str(y2.shape))
        
        #print("y " + str(y.shape))
        #print("y " + str(y))
        
        #plt.figure(1)
        #plt.subplot(221)
        #plt.imshow(x1[0].squeeze())

        #plt.subplot(222)
        #plt.imshow(x2[0].squeeze())
        #plt.show()
        
        #plt.figure(1)
        #plt.subplot(221)
        #plt.imshow(x1[1].squeeze())

        #plt.subplot(222)
        #plt.imshow(x2[1].squeeze())
        #plt.show()
        
        #plt.figure(1)
        #plt.subplot(221)
        #plt.imshow(x1[2].squeeze())

        #plt.subplot(222)
        #plt.imshow(x2[2].squeeze())
        #plt.show()
        
        #plt.figure(1)
        #plt.subplot(221)
        #plt.imshow(x1[3].squeeze())

        #plt.subplot(222)
        #plt.imshow(x2[3].squeeze())
        #plt.show()
        
        return x1, x2, y
     
        
    def to_string(self):
        for i in range(self.features.shape[0]):
            fea = self.features[i]
            lab = self.labels[i]
            print (str(fea.shape) + "\t" + str(lab))
  
        
        
class Data(object):
    def __init__(self, features, labels):
        
        partition = features.shape[0] / 4
        
        train_features = features[0:partition*3,:]
        train_labels = labels[0:partition*3]
        
        test_features = features[partition*3:partition*4,:]
        test_labels = labels[partition*3:partition*4]
        
        self.train = Dataset(train_features, train_labels)
        self.test = Dataset(test_features, test_labels)
        
        
    
def load_my_dataset(file_directory, number_of_images) :
    
     
    #
    # assumes list.txt is a list of filenames, formatted as
    #
    # ./lfw2//Aaron_Eckhart/Aaron_Eckhart_0001.jpg
    # ./lfw2//Aaron_Guiel/Aaron_Guiel_0001.jpg
    # ...
    #
     
    files = open( file_directory ).readlines()[0:number_of_images]
    print("number of files " + str(len(files)))

    features = np.zeros(( len(files), 250, 250, 1))
    labels = np.zeros((len(files)))
     
    # a little hash map mapping subjects to IDs
    ids = {}
    id_index = 0
     
    # load in all of our images
    index = 0
    for file_path in files:
     
        image_name = file_path.split('/')[3]
        image_name_parts = image_name.split('_')
        person_name = image_name_parts[0] + image_name_parts[1]
        if (person_name in ids) == False:
            ids[ person_name ] = id_index
            id_index += 1
        label = ids[ person_name ]
        
        image = np.array(scipy.misc.imread(file_path.strip()))
        features[ index, :, :, :] = image[:,:,np.newaxis]
        labels[ index ] = label
        index += 1

    print("Features shape= " +str(features[0].shape) + " Labels shape= " + str(labels[0].shape))

    data = Data(features, labels)
    return data
    
    
    
    
