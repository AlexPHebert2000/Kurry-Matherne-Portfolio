import { Work, Image } from '@prisma/client';
export interface WorkWithImages extends Work {
    images: Image[]
}