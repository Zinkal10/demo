#imports the base image of Nodejs
FROM public.ecr.aws/lambda/nodejs:16
# Copying all the files from your file system to container file system
COPY ./test-container-code/package.json  ${LAMBDA_TASK_ROOT}
# Install all dependencies
RUN npm install

# Copy other files too
COPY ./test-container-code/ ${LAMBDA_TASK_ROOT}
# Command to run app when intantiate an image
CMD ["src/handlers/creds/post-tokenaize.tokenaize"]