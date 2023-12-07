type MongoDoc<T> = import('mongoose').Document<unknown, any, T> &
  T & { _id: import('mongoose').Types.ObjectId };
