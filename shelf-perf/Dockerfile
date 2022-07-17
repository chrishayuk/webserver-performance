# use the default dart image as the build image
FROM dart:stable AS builder

# copy the current folder into the build folder
COPY . /app

# set the work directory
WORKDIR /app

# create the build directory
RUN mkdir build

# build the app
RUN dart compile exe ./bin/shelf_perf.dart -o ./build/shelf-perf

# use a slim image
FROM scratch

# copy the runtime files
COPY --from=builder /runtime/ /

# copy the binary from the build folder to the scratch
COPY --from=builder /app/build /bin

# start the dart server
CMD ["shelf-perf"]
